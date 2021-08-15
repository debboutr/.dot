#   ___   ___        _                            _
#  / _ \ / _ \      (_)_ __ ___  _ __   ___  _ __| |_ ___
# | | | | | | |_____| | '_ ` _ \| '_ \ / _ \| '__| __/ __|
# | |_| | |_| |_____| | | | | | | |_) | (_) | |  | |_\__ \
#  \___/ \___/      |_|_| |_| |_| .__/ \___/|_|   \__|___/
#                               |_|


# this can be used to soft-link to in the `~/.ipython/profile_default/startup/`
# directory to load django models OR modules frequented w/ GIS

import os
import ipdb

os.environ["PYTHONBREAKPOINT"] = "ipdb.set_trace"

in_env = "CONDA_DEFAULT_ENV" in os.environ.keys()
env = None if not in_env else os.environ["CONDA_PREFIX"].split("/")[-1]


if env == "gis":
    import geopandas as gpd
    import rasterio as rs


if env == "reg":
    from chemreg.compound.models import (
        DefinedCompound,
        IllDefinedCompound,
        BaseCompound,
        QueryStructureType,
    )
    from chemreg.substance.models import (
        QCLevelsType,
        Source,
        SubstanceType,
        SynonymType,
        SynonymQuality,
        Synonym,
        Substance,
    )
    from chemreg.lists.models import (
        RecordIdentifier,
        Record,
        ListType,
        List,
        ExternalContact,
        IdentifierType,
        AccessibilityType,
    )
    from chemreg.compound.serializers import (
        DefinedCompoundSerializer,
        IllDefinedCompoundSerializer,
    )
    from chemreg.substance.serializers import (
        QCLevelsTypeSerializer,
        SynonymTypeSerializer,
        SourceSerializer,
        SubstanceTypeSerializer,
        SubstanceSerializer,
        RelationshipTypeSerializer,
        SynonymQualitySerializer,
        SynonymSerializer,
        SubstanceRelationshipSerializer,
    )
    from chemreg.lists.serializers import (
        AccessibilityTypeSerializer,
        IdentifierTypeSerializer,
        ExternalContactSerializer,
        ListTypeSerializer,
        ListSerializer,
        RecordSerializer,
        RecordIdentifierSerializer,
    )
    from chemreg.users.models import User
    from chemreg.indigo.inchi import get_inchikey
    import io
    from rest_framework.renderers import JSONRenderer
    from rest_framework.parsers import JSONParser
    from rest_framework.test import APIRequestFactory
    from rest_framework.request import Request

    factory = APIRequestFactory()
    request = factory.get("/")
    serializer_context = {
        "request": Request(request),
    }


if env == "hem":
    from dashboard.models import (
        DataSource,
        GroupType,
        RawChem,
        DataGroup,
        DocumentType,
        DocumentTypeGroupTypeCompatibilty,
        DataDocument,
        ExtractedText,
        SourceCategory,
        Product,
        DuplicateProduct,
        ProductDocument,
        ExtractedListPresence,
        ExtractedListPresenceToTag,
        ExtractedListPresenceTagKind,
        ExtractedListPresenceTag,
        ExtractedCPCat,
        Script,
        QAGroup,
        UnitType,
        WeightFractionType,
        ExtractedComposition,
        ExtractedFunctionalUse,
        ExtractedHabitsAndPracticesDataType,
        ExtractedHabitsAndPractices,
        ExtractedHabitsAndPracticesToTag,
        ExtractedHabitsAndPracticesTagKind,
        ExtractedHabitsAndPracticesTag,
        ExtractedHPDoc,
        ExtractedHHDoc,
        ExtractedHHRec,
        ExtractedLMDoc,
        PUC,
        PUCToTag,
        PUCTag,
        PUCKind,
        DSSToxLookup,
        ProductToTag,
        ProductToPUC,
        ExtractedHabitsAndPracticesToPUC,
        QANotes,
        Taxonomy,
        TaxonomySource,
        TaxonomyToPUC,
        AuditLog,
        FunctionalUse,
        FunctionalUseCategory,
    )
    from feedback.models import Comment
