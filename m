Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795819073;
	b=Bxrjpm4+8FG/z9xpsjOHvPKAdywb79l5rWXj3kExKTZAUHxdm9A7oNJGVU93P6lVP24q
	 Lv5slEORTPgQh8bcNAAQib44huO/OT67uDTQxoXF7mGJjLb/HAqzEdhJJzE+64m+VvUhK
	 OcQeDCYvYcetoYECSaontR8pGH3al4oWZdgh8ScI0znuV05Evs3Ks2A0c/TFURJgeatDO
	 MSMN3K5ib6fWJ7WX+hKHkF2Nqi9bYDCG+mXfDKJnAY9U9xOj7zuH+iygbcHTkKapmEVt8
	 vo7JolTw9AhU2ry0nsEAJqbQ9OFZ+TGIWm3VTrMfTGhb6FDvvOWysK1RtjRw8aS3ldQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795819073;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tq4vvO9BS7u9vv4gu1rRkhvXdqzr46zgrAgFSiJEXyQ=;
	b=zcbvaInrzpzbwWaSCaNAGV08qfqI1INd/cuY9DFa0SuFhBPR+VGs75bo4MSl6D+1FxM+
	 c7TOa0OMkFjrMlYg/FLvYSw2MVLURhI05Qd42dvjlJgXnPlQ8lmn7cmyVsIhNpqjiWnO8
	 OBGtZV2DhqEqSJjzcRihFvi0JWTpXvoVjV7UurZICIc/24UV5S5taf0dGRFU/7HU/BWjJ
	 z/GqA34cdzGCIoWv/7CZsbJvTnFTAU6Kift32NrtIm4iCCHzouc2D6uQAkeEC3DLWbfAV
	 B0OLQ3ijjyEKJScTSO/ju7FoF4yMUXu0sN9k/H9fUHu3zQCmSgmVdnec+UWHsVWv+Yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=naHn28JT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7D1606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 22:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=naHn28JT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795819072;
	b=la1AdTcAOpqga87hvZ6PwY8U7Ct9s47RudGp6VRz2r3+k2fKQZNuXB0vrdCZLK6CAows
	 R6GcL2hEAPm5QlbctxHWosLqIoYUCG67lMDrsN6pglBrkz4PmRW148G1mtqdg90W5CTD8
	 uRkeNbUGqiHTU3nE/c1lJRGnh+pkcnozOMBKrIHO0WgC1D99alvl5IiB5zhp4wQaw2LKG
	 Wd3YEeNqOgMphgfb+DV+PafvGnn1dyCaEnN1eMhC9uolldGhu9DljqTJBdc9fGCq/MCuR
	 fKUBuZ+DrwoYunbr9z2R0YaWMw0j0n4iGrsn4hgsoHQsCSfvBNxlyRFqcnDp3fCjAoQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795819072;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tq4vvO9BS7u9vv4gu1rRkhvXdqzr46zgrAgFSiJEXyQ=;
	b=u4gvdsn6L7x0aTZZ9zgAG5qIAD/oJpqp2UYRzx7IfW3OJrpkobfCmDA+b1wB+xh4WedD
	 b7ObMU7G9YXGhuSavKNqW2pfqYtb5Z/3tufgpdDMOe/JPVKJTnM+BT/1gBbna8FhUR+6E
	 /0SsHs1PozPHUyLV1Vfb5Bj/7vUGruhs6d3PO4UkciroSTPltUpRFEsWVFi/vfMysMWX0
	 NFyM0Py8jObgbZdkNCLk0p1Bs5Zkrq+le0XHwwawLC4WL9snkw77Zqz7YIR3Z9iN/lvbB
	 lhUCvB28CRHu7fBAQ4lXgZz9S9G7ORvK6k5Hy9nt++O4BjHMagi/Rt76m8Jrd5aTXsg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8185E1F00898;
	Fri, 27 Nov 2026 22:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795819072;
	bh=tq4vvO9BS7u9vv4gu1rRkhvXdqzr46zgrAgFSiJEXyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=naHn28JTO4VcXfRR1LP0tC8abI+a2QqBYQAusyEnXJeYBcOrWDLdikvCIORyzW8Oi
	 f+b74fLGarKbY7GdtI9sGadEtGL2LQZNcACUPQuiQyuaW+d97tzhTLizbl3mCl8fPB
	 037oOsSFxV48N8+YCERMLY17/vkV6GcwKA8q3jiX7y10k1G8yhVYRGasAYtBERQc3Y
	 euFPpHln4dnhNTkNc5uCL421lWGmry0ADjc1tMDVNfcRUvEIAhGBvEhkuzFRxEExbr
	 3BZQpIvdRymz0i0D8V8MUYP+PKUa3ov/sKmc/a++aEIexu8FOWgCWQedL+oL/zyH2i
	 xXdlCjuQmiD0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 06E504DE5E;
	Fri, 27 Nov 2026 22:37:45 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Fri, 27 Nov 2026 23:37:41 +0100
Subject: [PATCH iproute2-next 3/3] testsuite: add test for lisp
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-iproute2-lisp-v1-3-df8ea175bc06@free.fr>
References: <20261127-iproute2-lisp-v1-0-df8ea175bc06@free.fr>
In-Reply-To: <20261127-iproute2-lisp-v1-0-df8ea175bc06@free.fr>
To: David Ahern <dsahern@kernel.org>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, Matthieu Baerts <matttbe@kernel.org>, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795819063; l=2428;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=WXV+PDL4dcCQwPuXlvDRBbz0HV1YFgXClHcIX/Zyvgs=;
 b=QPx5sQVmJPzptU9SthlUiSkF6FIHbKrfQ5PQg+mrHOIHfnFLFwiY8zJ3NfCZT3xRJFdfh10Ri
 10PkHB/DXOeC54IfswMr2ztOyEL9wVoAXh/KjMmEeUH+3Qecik7pv5F
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

LISP checks

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 testsuite/tests/ip/link/add_type_lisp.t | 59 +++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/testsuite/tests/ip/link/add_type_lisp.t b/testsuite/tests/ip/link/add_type_lisp.t
new file mode 100755
index 00000000..d42f6dd3
--- /dev/null
+++ b/testsuite/tests/ip/link/add_type_lisp.t
@@ -0,0 +1,59 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2026 Vincent Jardin <vjardin@free.fr>, Free Mobile
+
+. lib/generic.sh
+
+# Skip test on a kernel without LISP
+NEW_DEV="$(rand_dev)"
+$IP link add dev "$NEW_DEV" type lisp id 1 2> /dev/null || ts_skip
+$IP link del dev "$NEW_DEV"
+
+ts_log "[Testing Add LISP interface (instance ID)]"
+NEW_DEV="$(rand_dev)"
+
+ts_ip "$0" "Add $NEW_DEV LISP interface (instance ID)" link add dev "$NEW_DEV" type lisp id 101
+
+ts_ip "$0" "Show $NEW_DEV LISP interface (instance ID)" -d link show dev "$NEW_DEV"
+test_on "$NEW_DEV"
+test_on "lisp id 101"
+test_on_not "external"
+test_on_not "local"
+
+ts_ip "$0" "Del $NEW_DEV LISP interface (instance ID)" link del dev "$NEW_DEV"
+
+
+ts_log "[Testing Add LISP interface (local RLOCs)]"
+NEW_DEV="$(rand_dev)"
+
+ts_ip "$0" "Add $NEW_DEV LISP interface (local RLOCs)" link add dev "$NEW_DEV" type lisp id 16777215 local 192.0.2.1 local 2001:db8::1
+
+ts_ip "$0" "Show $NEW_DEV LISP interface (local RLOCs)" -d link show dev "$NEW_DEV"
+test_on "$NEW_DEV"
+test_on "lisp id 16777215"
+test_on "local 192.0.2.1"
+test_on "local 2001:db8::1"
+
+ts_ip "$0" "Show $NEW_DEV LISP interface (local RLOCs, JSON)" -d -j link show dev "$NEW_DEV"
+test_on '"id":16777215'
+test_on '"local":"192.0.2.1"'
+test_on '"local6":"2001:db8::1"'
+
+ts_ip "$0" "Del $NEW_DEV LISP interface (local RLOCs)" link del dev "$NEW_DEV"
+
+
+ts_log "[Testing Add LISP interface (metadata)]"
+NEW_DEV="$(rand_dev)"
+
+ts_ip "$0" "Add $NEW_DEV LISP interface (metadata)" link add dev "$NEW_DEV" type lisp external
+
+ts_ip "$0" "Show $NEW_DEV LISP interface (metadata)" -d link show dev "$NEW_DEV"
+test_on "$NEW_DEV"
+test_on "lisp external"
+test_on_not "lisp id"
+
+ts_ip "$0" "Show $NEW_DEV LISP interface (metadata, JSON)" -d -j link show dev "$NEW_DEV"
+test_on '"external":true'
+
+ts_ip "$0" "Del $NEW_DEV LISP interface (metadata)" link del dev "$NEW_DEV"
+

-- 
2.43.0


