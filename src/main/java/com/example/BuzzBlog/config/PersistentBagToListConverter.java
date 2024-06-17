package com.example.BuzzBlog.config;

import org.hibernate.collection.spi.PersistentBag;
import org.modelmapper.AbstractConverter;
import java.util.ArrayList;
import java.util.List;

public class PersistentBagToListConverter extends AbstractConverter<PersistentBag, List> {
    @Override
    protected List convert(PersistentBag source) {
        return new ArrayList<>(source);
    }
}
