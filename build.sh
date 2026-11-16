find ../juptune/src/juptune/ -name "*.d" | xargs ../marmos/build/marmos convert \
                                                -o "site/1-API Reference" \
                                                --use-default-conf=false \
                                                --pretty \
                                                -i=../marmos/subprojects/dmd-fe/druntime/src/ \
                                                -i=../marmos/subprojects/dmd-fe/compiler/src/ \
                                                -i=../marmos/subprojects/dmd-phobos/ \
                                                -J=../marmos/subprojects/dmd-fe/compiler/src/dmd/res \
                                                -i=../juptune/src/ \
                                                -J../marmos/subprojects/dmd-fe/ \
                                                --feature-semanticPass=true \
                                                -V=Juptune_OpenSSL \
                                                -V Juptune_LibSodium

rm ./site/1-API\ Reference/juptune.asn1.generated*
../marmos/build/marmos docs generate

mv _build build
mv to-copy-into-build/* build/