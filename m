Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581538;
	b=kxjkqDhUJXZWwBdz8qnSGKeMfmmumUDJTxT28Tge6k03gcabfzETt58C6QIiTXqUrMBd
	 2fDgGPH25oofEG7Es82/TkyDPbPVBYAUHFsclGdFNwU9B6KNM0B9lfjNE5GML9X+GAKdU
	 rsFlTll69ta14XFcNlnxOi7w/HWyvjVkM49Kruwpvhz0QSRepXN+8dHfQ1vlq5B1hh78R
	 8IVHamE3X4kwqPJ+WWK653xShYYDOSbRBjoJPyXR7NQWYS66b7ntm2r8ut9ZFqL9G6p0O
	 PzOVyI9L74oP0LvdWPtV/1BJHhrbxp4Mhb1SoiWKxawjyfEDStEHTZCt9/E4e707TFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Xqxp4hd5lpGFlJROYYWcFRii84BajA/8pPUPXDvAQR8=;
	b=zVv9NFxKiT2iVMxTHfbZKNeE9UxMWwRf1w/SGJApawrdffAAXCPWvaSVw54f6kLHYcjN
	 0v8keOCWEFujr8dqN7Dz3T2ZEvRpOSrkHc8lyh1AAsTPudoTEKlIHI5LUoDoo8p7e0f3L
	 tA7EY8BB73MHsyx8oqJLR1RlRXPdYtHMZLae4UhaiGGnwyGQIlnYgTgkHCthZ6NKABGRn
	 GYp85aDnxUVPydBDBmowZiYtxwsxTKe8+32ghSevIMeTcgNCi0CQdhUFsX497fNvie8Jh
	 buKYRKTTtIxkZWWnHmKRzHtFQhNwY0ChrVIjPcL4r4nUTHW1oNyLUhguOAlShFS/JFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=V681Bgc6;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834B5606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 04:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 834B5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=V681Bgc6
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f03920c477so45093145ad.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795581533; x=1796186333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xqxp4hd5lpGFlJROYYWcFRii84BajA/8pPUPXDvAQR8=;
        b=V681Bgc6qPFYjqmG0NtYlr4ry2IAle27e1weiA/EQZ6p5mn/BHTJWnVrZvvSm3SebG
         Nw1ik97JbrQ1eqpQolnrleQOPUBcwhfkM71yqQiyVwCwGOIKAPyRFag5/9hDHjWNpXre
         jxXBkgWdkXEiZ7mfrvsSJdAkOa4icqlggNKAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581533; x=1796186333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xqxp4hd5lpGFlJROYYWcFRii84BajA/8pPUPXDvAQR8=;
        b=B4uZeT09Gm0qEum2bYikN8kmf6hLfanTR8WjQXHsmWQyDNOUjjZvOu1Mpy6DktCVcH
         pcYV38VhMQMc+Khu20I/Fcuf8f2mVRLTz0UfMM6OPXByOG5OZp6uV8m5ZLiZOQxaAmDa
         rmmNbApE5FQC+T9zhbNtumtxeSkpvGvSI2RGc9dI5PXDY7vjMLgfWcxOoNyxmzHuJxHj
         bxBbkBglLQfhG1GGFs44V6d8FVpQC6kxMgGG39WoGfmxx+u9TkSFuE9yihB1b4rjKF+h
         ybLrso039B3BpOOC3m8ZoU1GHc2ffXCrcReRuNfG6Gb9b7cRMOh6N3U3mw0oInkWRqPa
         DeKA==
X-Gm-Message-State: APuU4Z8lhBu0ey5il4cuLMl0io/J5PwOtOAdt53PpJAH9FrUBCQgMJR1
	InLpvp8YNwf9C2CGK5k1pyOvSP3jQcHVM8K/F10WAket2qq/VNu2L1tuWYi+H0zwnZe12R1N1N/
	6duL58/c=
X-Gm-Gg: AZFdTZcynA9UYSCKuMjjyWwloWHunSU3sGylJ9ao+9AU9gE8bjM5fvMqWzZ0/oKKQT+
	u2zkZV8KMCGS6w9Vcva4epgCIuFLrM4t3WJZsO63NJyAReA1xTh3DeEgxntfg0soZ9Xe1rQttYr
	mSdZpViWTmCFR2C+4VgIlwPoeafGBJFAYy5Wz/yWCo0F5isqix7hXTyl/DSHF+wp46qEfLqy2LF
	LRk1i2J2xzZf0S10GKp6y8HNXRTncLref44w+yLzWpf0u1adELd4q/rTN5Mxhl+hQV8dlb4RFHw
	EwW+9OqVvVt3VSYpk/0vMn6M+cgT8JgJTmDMEizDELZnf1jZo2pvKN/KkrwdTHj9BKTgKBvjBlb
	zWDwgHS4IOCICuiqfQ7GTkjZmJj2DFrlwY+hXUUxZeB9irDo4PzBhXcYlSnFLIkA5aZNfL2eK1n
	8KEQUBDsjg2yyK5aTCQU2tkHFiptYnMTb40wXhGkpzfflAdkjqaayEEW2QyuvuiAar1hAol1LS4
	qN1/RfXZNu98I9GCMwy0eSPWQIIirlC7iItFEyoyhwtWJ47ARFnsufO68p3c9Vwrf+PcPDpN2vS
	UR/+jxErZgw0XThj2tIrUfVHLu1voAsO3OV32CmjKv6q/3wEX3pMzCNJeHl9MYjk932FJNt/m9i
	hXaJew6ESiSVpys565KbiaFUBLlQO0ATtSwiGg4dWYAj9u2qdqYHq3poUpEEvC3l1b0bzpFXfvC
	3bYhK9XkXVsg==
X-Received: by 2002:a17:902:e844:b0:2e8:4066:d247 with SMTP id d9443c01a7336-2f050c1e95emr142227635ad.33.1795581532788;
        Tue, 24 Nov 2026 20:38:52 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm78575765ad.7.2026.11.24.20.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:38:52 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	stable@vger.kernel.org
Subject: [PATCH wireless v2] wifi: mac80211: store the mesh IE blob's length without truncating it
Date: Wed, 25 Nov 2026 10:08:47 +0530
Message-Id: <20261125043847.885053-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

struct ieee80211_if_mesh keeps the length of the user's mesh IE blob in a
u8, and copy_mesh_setup() assigns it from a size_t that the netlink policy
allows to reach IEEE80211_MAX_DATA_LEN:

	[NL80211_MESH_SETUP_IE] =
		NLA_POLICY_VALIDATE_FN(NLA_BINARY, validate_ie_attr,
				       IEEE80211_MAX_DATA_LEN),
	...
	if (setup->ie_len) {
		new_ie = kmemdup(setup->ie, setup->ie_len, GFP_KERNEL);
	...
	ifmsh->ie_len = setup->ie_len;

So the buffer holds the whole blob and the field holds the low eight bits
of its length.  Three things follow, and none of them is cosmetic.

A blob whose length is a multiple of 256 stores a length of zero, and both
builders return early on "!ifmsh->ie_len" - a secure mesh silently drops
its RSN element, from a configuration the kernel accepted.

The stored length also no longer describes the blob: it can fall inside an
element.  ieee80211_ie_split_vendor() walks one whole element at a time,

	while (pos < ielen && ies[pos] != WLAN_EID_VENDOR_SPECIFIC)
		pos += 2 + ies[pos + 1];

so with a truncated ielen it steps over the element that crosses the
truncated end and returns a position past ielen.  A 257-byte RSN element
followed by a three-byte element gives nla_len 260 and ifmsh->ie_len 4,
and the split returns 257.

And the beacon builder budgets the truncated length while copying what was
actually assembled:

	tail_len = ... + ifmsh->ie_len;
	bcn = kzalloc(sizeof(*bcn) + head_len + tail_len, GFP_KERNEL);
	skb = __dev_alloc_skb(max(head_len, tail_len), GFP_KERNEL);
	...
	bcn->tail_len = skb->len;
	memcpy(bcn->tail, skb->data, bcn->tail_len);

The builders' skb_tailroom() checks bound only that scratch skb, whose head
the allocator rounds up, so an emit larger than tail_len passes them and
the memcpy writes past the kzalloc()ed block.  In the peering frames that
mesh_plink_frame_tx() builds the skb IS the frame and is sized from the
same u8 field, so there the same over-long emit is refused by the tailroom
check and the frame is dropped - a failure, not a corruption.

Store the length as the size_t it is, and widen the two locals that derive
from it: offset and len in mesh_add_vendor_ies(), and len in
mesh_add_rsn_ie(), which truncated a 257-byte element to one byte and a
256-byte element to zero.  With the field holding the real length, the
length again describes the blob validate_ie_attr() framed, the split
cannot overshoot it, and both the beacon budget and the peering-frame
budget are the size of what the builders may emit.

Fixes: 082ebb0c258d ("mac80211: fix mesh beacon format")
Cc: stable@vger.kernel.org
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
Link: https://lore.kernel.org/all/20261124003526.78471-3-piyus@iiitd.ac.in/

This applies on top of the v2 of the other patch of the v1 series, "wifi:
mac80211: do not copy the mesh RSN IE twice into the beacon", which is posted
in its own thread and answers its own review.  Each patch of the v1 series
drew a review of its own, so each is respun separately.

Changes in v2, all from the review of v1:

 - THE PREMISE WAS FALSE AND THE PATCH WAS UNSAFE WITHOUT IT.  v1 said "the
   extra IE blob a mesh join carries is bounded by IEEE80211_MAX_DATA_LEN,
   2304 bytes, and ifmsh->ie_len is a size_t", and the field is a u8.  The
   review showed what that cost: widening the RSN length to unsigned int
   REMOVED the truncation that had been accidentally containing the copy, so
   a 257-byte RSN element behind a 4-byte stored length went from emitting
   one byte to emitting all 257 into a four-byte budget.  v1's closing
   "Neither is a memory-safety problem" was wrong in the one direction that
   matters.

 - So v2 fixes the field rather than only the locals: struct
   ieee80211_if_mesh::ie_len becomes the size_t that struct mesh_setup and
   the nl80211 policy already use.  That is the first of the three remedies
   the review offered, and it is the one that makes the stored length
   describe the blob again - after which ieee80211_ie_split_vendor() cannot
   overshoot it, the beacon budget is the size of what may be emitted, and
   the peering-frame budget in mesh_plink_frame_tx(), which is sized from the
   same field, is too.

 - The subject and the commit message are rewritten around that.  v1
   described vendor elements starting past byte 255 reaching
   mesh_add_vendor_ies(), which the review correctly points out cannot
   happen - the truncation is at the struct field, earlier than v1 said.

 - Two further consequences the review found are now stated: a blob whose
   length is a multiple of 256 stores zero, so a secure mesh silently drops
   its RSN element; and widening offset is not a no-op either, since the old
   u8 wrapped on an overshooting split and copied a few bytes where nothing
   is copied now.

 - Fixes: is now 082ebb0c258d ("mac80211: fix mesh beacon format") rather
   than 2b5e19677592 ("mac80211: cache mesh beacon").  Confirmed by reading
   082ebb0c258d: it is the commit that added "u8 offset, len" to
   mesh_add_vendor_ies() and "u8 len = 0" to mesh_add_rsn_ie(), and the
   truncation predates the beacon caching and reaches the peering frames as
   well.  The review is right that this decides which stable trees take it.

Measured, and not: the beacon overrun this series is about was reproduced on
mainline 7.4-rc3 and on 7.3.1, with KASAN reporting a slab-out-of-bounds
write in ieee80211_mesh_build_beacon().  The truncation routes the review
found - the multiple-of-256 blob, and the 257-byte element with a four-byte
stored length - come from reading the code and have NOT been run here.
mesh.c, cfg.c and mesh_plink.c all build clean, and checkpatch --strict
reports nothing.
---
 net/mac80211/ieee80211_i.h | 2 +-
 net/mac80211/mesh.c        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 7a64aef6890d..e0f1bc0a618f 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -826,7 +826,7 @@ struct ieee80211_if_mesh {
 	int num_gates;
 	struct beacon_data __rcu *beacon;
 	const u8 *ie;
-	u8 ie_len;
+	size_t ie_len;
 	enum {
 		IEEE80211_MESH_SEC_NONE = 0x0,
 		IEEE80211_MESH_SEC_AUTHED = 0x1,
diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index c86be97bc921..940af399343a 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -354,7 +354,7 @@ int mesh_add_vendor_ies(struct ieee80211_sub_if_data *sdata,
 			struct sk_buff *skb)
 {
 	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
-	u8 offset, len;
+	size_t offset, len;
 	const u8 *data;
 
 	if (!ifmsh->ie || !ifmsh->ie_len)
@@ -378,7 +378,7 @@ int mesh_add_rsn_ie(struct ieee80211_sub_if_data *sdata, struct sk_buff *skb)
 {
 	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
 	size_t prefix;
-	u8 len = 0;
+	unsigned int len;
 	const u8 *data;
 
 	if (!ifmsh->ie || !ifmsh->ie_len)
-- 
2.34.1

