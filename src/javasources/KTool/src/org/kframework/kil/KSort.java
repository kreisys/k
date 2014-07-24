// Copyright (c) 2012-2014 K Team. All Rights Reserved.
package org.kframework.kil;

public enum KSort {
    K, Bag, BagItem, KItem, KList, CellLabel, KLabel, ;

    @Deprecated
    public static KSort getKSort(String sort) {
        try {
            return KSort.valueOf(sort);
        } catch (IllegalArgumentException e) {
            return K;
        }
    }

    public static KSort getKSort(Sort2 sort) {
        return getKSort(sort.getName());
    }

    public KSort mainSort() {
        switch (this) {
        case Bag:
        case BagItem:
            return Bag;
        case KItem:
            return K;
        default:
            return this;
        }
    }

    public boolean isDefaultable() {
        return (this == Bag || this == K);
    }
}
