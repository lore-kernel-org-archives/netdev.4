Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115002;
	b=ukM5V9MG226wdprxWllThEL9mSo/EzVxAMYB7CFWJymBV+t03LosewgCkjy75EMtwD3F
	 SL3a73KaxGAIywTeenqQ2yQmQJorD2RUFaorX6466VZ9qGHWroh7+aMA9zhvb+3ymgoOk
	 AQ60xiYxQvkUTVP9HB2qC1vacTdGDH2kI8IDlpQGZCwPC0lTNgrnIMkxWinn8ulygDPiO
	 vPiT1HbqPASmAhAw9FjoTwstgbfmWl2bvbOx365mUkk2VpmEqW2wA4FApSNN5XTNENPnn
	 TJsYDXYJdRXGcyXv3q1zwBTU/ivsbZVa8GJmRrjryAZewSAUU7pnaz9saqYVNSSRkag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Sv/zOFI6s0+txZCeiypwYtPvnfXTL1p+1EaP5x96XP0=;
	b=o+owK7igL20kV5Erw+q1wQlchcA8BcEvbmNOZT6WQNPE27Jbk1o9ELmTdfyLvZWAsu+t
	 J2337Fz5o7urPXMVvEiCllN8omvwGwWgUenZUmqNg1hjb2XtmANsBUcygnRMUOlK4aNnY
	 b7+Q7RprsscmIhusChD5pvqQ3Cwj3dCsY5L8LrDQVqUf2HNTYL8CTEQK8GioNUbaq63jb
	 /jnUHPexcn4lXIZ53jUJPgvyzWMupK+VIPP7M8/cVq7TCP1hbR2YpQu+DS2ReH+zxUxZ0
	 f2QKW1xsy4cxxNUkRgeuz/oUVX+Yly+c30grDLIwLANKwrl0ThjdZTK5mnCWYzXh1GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ABWNjZvY;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD3260A2620
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD3260A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ABWNjZvY
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2efe0e3bdceso286425ad.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795115001; x=1795719801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sv/zOFI6s0+txZCeiypwYtPvnfXTL1p+1EaP5x96XP0=;
        b=ABWNjZvY5rDoklpu8BckdbHsAzTWYf45Mf3OFYDqt1E9PxGhS16c9Fq5iZL0FabYxO
         9SqNw93Ml2HOHs9WHHsVT7WO9R+RtmdWzZF4bwlLHAjTvQAUjIF/kE70WlHztBCXmDlb
         rh6+Q4IKVWj2UhK2pqCWbcG4pNlN0T6mogCYKv24R6hIRjOCArccNk+XcYGXlrI5PDCg
         cb4K/V3qjurc+oV8C+3NlOFqB/BYZ5onWo6iP8RzDchNgvCJ2bbCQ25xQqrUhiZViPxV
         e/QpnM8N+R6ci+uFqbThHtIPusVEcapthiNquOGBW/sR7Tfoe264Kc8coqX5tZVpktw+
         dYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115001; x=1795719801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sv/zOFI6s0+txZCeiypwYtPvnfXTL1p+1EaP5x96XP0=;
        b=sYPg/ouGX/isTTHt3BMbqGBTadyykAcqYXs/KdEQx7e1zGUEOTnw7UmxAubAlsX/kY
         9ZXa1o7mLL5fkRXugS/RYSouroJjF4n9+i3Nevrl1TMNsdJE4+zBu4q6iRwLstUJm+gc
         47UYHiwJ3HY8hsavky0I7Gk/oMj5f4W8vaX4xuWvbW+0fMR6lV5NT8/xJiagOFpmvp3/
         WOnJrFqKClv+hBW3Fm9T05SOPbtzHlBzPL8Y83TBAjLY6i8un9fJTBGdMYEWVteA9saA
         5aMZYbTz9fOmDc5Xr8g0uQD5zaR7eL29Lmdl5opIHcOlxjG+vfT2Cp+WUgvPBd+Zk0Eg
         kzZw==
X-Gm-Message-State: APuU4Z/Wn4VSp3LQBheIbX2vM9nCC3NZsYys/W8X3Lb5XvsvWCqHWkuJ
	82Jb0tTPMEImHqGIzg4u4QX9kNV81iiQDqmNA6xAJ4s4bSSYdc8UgQ/072NOXWRaHKV+7p4VMOM
	LLTnjuEg=
X-Gm-Gg: AZFdTZdInTMLu1z0HM22zt1S0hs8rTCs+xLAOqJ9uI9o5XXO8ZD4fozN5v+PG5GR89Z
	2c7n4NT+MWt7zAftlsUUd7/Ele2w7Q1wn8t5UsUeCNTyGLngTL60nm+6u9FEWlJLd+HND515vC/
	99uyKXaKepJMTpWInB4V4mfnALmQX5GH3pGdjtgBBktq5RH24jTDhvqFvRrF3mI/Mk/ohEu4HRW
	ko83R3gFHwPYGK5uEvLLSeWeCpvF+6CH18kpSmF+rDvt+Q2wy4zpEUq+2Kfsq/eDzo/ZLixKFek
	Bf5P4QLlSgwbx/W0KgON9xS0NEnD+OcWHvauI6EOtl232KeTJew15uVt1dJNRIux78fGM2MiRjv
	trFIEVtmmG0J7AI3Q/mJRJuKLD5ZkK3n9ogGOwtcuHOnyENCSkoIjOmhiP7d11AimKxFzOo98ll
	SFwUqiUvkGKv1KCbH/4Ge5E564OvOv0TG25EvR/zc2zTloizbxkOc74uLco/bkUTKhUXM90gWZr
	1MztyG/r+bibPYvZxMndAAdRgFDBcFuuhIVnjNN3ylokvNJp9dAwBKjIw8jlbsSHJC5eHDUo3vJ
	mCSe/i4gDdplbGX4ZDcK5fBSInCzD8x+QESYM0GbS/0ZsyprBO5osG1bjDYLOLDz/Y7i
X-Received: by 2002:a17:902:f54c:b0:2e6:1828:59fa with SMTP id d9443c01a7336-2f03f176781mr8331985ad.18.1795115001227;
        Thu, 19 Nov 2026 11:03:21 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0de00asm3750225ad.35.2026.11.19.11.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:03:20 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2-next v2 7/7] testsuite: add tc bpf test
Date: Thu, 19 Nov 2026 11:02:42 -0800
Message-ID: <20261119190312.578885-8-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119190312.578885-1-stephen@networkplumber.org>
References: <20261119190312.578885-1-stephen@networkplumber.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Covers the paths the BPF front end has no coverage for today: loading
a classifier from an object file, the resulting filter output in plain
and JSON form, where a cls program's maps get pinned, rejection of an
object with a legacy "maps" section, and tc exec bpf graft against a
pinned program array.

The pin path assertion is the interesting one. Maps of a cls program
pin below the tc/ subdirectory of the bpffs mount, and that only held
as a side effect of a cache priming call in bpf_init_env(). Nothing
noticed when it stopped happening, because the object still loaded and
the filter still attached. Check the full path, not just that the
filter came up.

Needs clang with a bpf target and a mountable bpffs, and skips when
either is missing rather than failing.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 testsuite/tests/tc/bpf.t | 153 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100755 testsuite/tests/tc/bpf.t

diff --git a/testsuite/tests/tc/bpf.t b/testsuite/tests/tc/bpf.t
new file mode 100755
index 00000000..724e8ef5
--- /dev/null
+++ b/testsuite/tests/tc/bpf.t
@@ -0,0 +1,153 @@
+#!/bin/sh
+# BPF classifier: object loading, map pinning and graft.
+#
+# Needs clang with a bpf target to build the test objects, and a
+# mountable bpffs for anything that pins. Skips if either is missing.
+
+. lib/generic.sh
+
+CLANG="${CLANG:-clang}"
+
+command -v "$CLANG" >/dev/null 2>&1 || ts_skip
+echo 'int f(void) { return 0; }' > "$STD_OUT.c"
+$CLANG -target bpf -c "$STD_OUT.c" -o "$STD_OUT.o" 2>/dev/null || ts_skip
+rm -f "$STD_OUT.c" "$STD_OUT.o"
+
+WORK=$(mktemp -d)
+BPFFS="$WORK/bpffs"
+mkdir -p "$BPFFS"
+mount -t bpf bpf "$BPFFS" 2>/dev/null || ts_skip
+trap 'umount "$BPFFS" 2>/dev/null; rm -rf "$WORK"' EXIT
+
+export TC_BPF_MNT="$BPFFS"
+
+# Headers live next to the test tree, reached via the iproute2 build dir.
+SRCDIR=$(cd "$SNAME" && pwd)
+
+# linux/types.h pulls in asm/types.h, which lives in the multiarch
+# directory that a bpf target does not search by default.
+MULTIARCH=$(${CC:-cc} -print-multiarch 2>/dev/null)
+[ -n "$MULTIARCH" ] && ARCHINC="-I/usr/include/$MULTIARCH"
+
+build_obj()
+{
+	$CLANG -target bpf -O2 -g -I"$SRCDIR/include" $ARCHINC \
+		-c "$1" -o "$2" 2>/dev/null
+}
+
+cat > "$WORK/cls.c" <<'EOF'
+#include "bpf_api.h"
+
+struct {
+	__uint(type, BPF_MAP_TYPE_ARRAY);
+	__uint(key_size, sizeof(uint32_t));
+	__uint(value_size, sizeof(uint32_t));
+	__uint(max_entries, 1);
+	__uint(pinning, LIBBPF_PIN_BY_NAME);
+} test_map __section(".maps");
+
+__section("classifier")
+int cls(struct __sk_buff *skb)
+{
+	return 0;
+}
+
+BPF_LICENSE("GPL");
+EOF
+
+build_obj "$WORK/cls.c" "$WORK/cls.o" || ts_skip
+
+DEV="$(rand_dev)"
+ts_ip "$0" "Add $DEV dummy interface" link add dev $DEV up type dummy
+ts_tc "$0" "Add clsact qdisc" qdisc add dev $DEV clsact
+
+ts_tc "$0" "Add BPF filter from object file" \
+	filter add dev $DEV ingress bpf da obj $WORK/cls.o sec classifier
+ts_tc "$0" "Show ingress filters" filter show dev $DEV ingress
+test_on "cls.o:\[classifier\]"
+test_on "direct-action"
+
+ts_tc "$0" "Show ingress filters as JSON" -json filter show dev $DEV ingress
+test_on "\"bpf_name\":\"cls.o:\[classifier\]\""
+
+# A cls program pins below the tc/ subdirectory, not at the mount root.
+echo -n "test on: \"map pinned under tc/globals\""
+if [ -e "$BPFFS/tc/globals/test_map" ]; then
+	pr_success
+else
+	pr_failed
+fi
+
+# libbpf 1.0 and later refuse an object with a legacy "maps" section.
+cat > "$WORK/legacy.c" <<'EOF'
+#include <linux/bpf.h>
+
+struct bpf_elf_map {
+	__u32 type, size_key, size_value, max_elem, flags, id, pinning;
+};
+
+struct bpf_elf_map __attribute__((section("maps"), used)) old_map = {
+	.type		= BPF_MAP_TYPE_ARRAY,
+	.size_key	= sizeof(__u32),
+	.size_value	= sizeof(__u32),
+	.max_elem	= 1,
+};
+
+__attribute__((section("classifier"), used))
+int cls(struct __sk_buff *skb)
+{
+	return 0;
+}
+
+char __attribute__((section("license"), used)) _license[] = "GPL";
+EOF
+
+if build_obj "$WORK/legacy.c" "$WORK/legacy.o"; then
+	echo -n "test on: \"legacy maps section rejected\""
+	if $TC filter add dev $DEV ingress bpf da obj $WORK/legacy.o \
+		sec classifier 2>&1 | grep -q .; then
+		pr_success
+	else
+		pr_failed
+	fi
+fi
+
+# Graft: load an entry program that tail calls through a pinned prog
+# array, then replace the entry in that map from a second object.
+cat > "$WORK/graft.c" <<'EOF'
+#include "bpf_api.h"
+
+struct {
+	__uint(type, BPF_MAP_TYPE_PROG_ARRAY);
+	__uint(key_size, sizeof(uint32_t));
+	__uint(value_size, sizeof(uint32_t));
+	__uint(max_entries, 1);
+	__uint(pinning, LIBBPF_PIN_BY_NAME);
+} jmp_tc __section(".maps");
+
+__section("aaa")
+int cls_aaa(struct __sk_buff *skb)
+{
+	return 0;
+}
+
+__section_cls_entry
+int cls_entry(struct __sk_buff *skb)
+{
+	tail_call(skb, &jmp_tc, 0);
+	return BPF_H_DEFAULT;
+}
+
+BPF_LICENSE("GPL");
+EOF
+
+if build_obj "$WORK/graft.c" "$WORK/graft.o"; then
+	ts_tc "$0" "Remove clsact qdisc" qdisc del dev $DEV clsact
+	ts_tc "$0" "Add clsact qdisc" qdisc add dev $DEV clsact
+	ts_tc "$0" "Add tail call entry program" \
+		filter add dev $DEV ingress bpf da obj $WORK/graft.o \
+		sec classifier
+	ts_tc "$0" "Graft section aaa into pinned prog array" \
+		exec bpf graft m:globals/jmp_tc key 0 \
+		obj $WORK/graft.o sec aaa
+fi
-- 
2.53.0

