package ru.job4j.cars.repository;

import org.hibernate.query.Query;
import ru.job4j.cars.model.CarBody;
import ru.job4j.cars.store.HBmStore;

import java.util.Collection;

public class CarBodyRepository {

    private static final class Lazy {
        private static final CarBodyRepository INST = new CarBodyRepository();
    }

    public static CarBodyRepository instOf() {
        return CarBodyRepository.Lazy.INST;
    }

    public Collection<CarBody> findAllCarBodies() {
        return HBmStore.instOf().tx(session -> session.createQuery("from CarBody ").list());
    }

    public CarBody findCarBodyForId(int id) {
        return HBmStore.instOf().tx(
                session -> {
                    final Query query = session.createQuery("from CarBody where id=:id")
                            .setParameter("id", id);
                    return (CarBody) query.uniqueResult();
                }
        );
    }

    public void saveCarBodies(CarBody carBody) {
        HBmStore.instOf().tx(session -> session.save(carBody));
    }

}
