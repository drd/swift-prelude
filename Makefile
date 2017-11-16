linux-main:
	sourcery \
		--sources ./Tests/ \
		--templates ./.sourcery-templates/ \
		--output ./Tests/ \
		--args testimports='@testable import PreludeTests; @testable import EitherTests; @testable import DerivingTests; @testable import FrpTests; @testable import NonEmptyTests; @testable import OpticsTests; @testable import ReaderTests; @testable import StateTests; @testable import TupleTests; @testable import ValidationNearSemiringTests; @testable import ValidationSemigroupTests; @testable import WriterTests;' \
		&& mv ./Tests/LinuxMain.generated.swift ./Tests/LinuxMain.swift

test: linux-main
	swift test

test-linux: linux-main
	docker build --tag swift-prelude-test . \
		&& docker run --rm swift-prelude-test