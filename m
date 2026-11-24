Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480539;
	b=i1nQl3F4+w/07OD7PFp35WLsTkkxCYU28KyCeSeeTSw+HqkY4ssZxG9yVFEUOFDUsD/D
	 1b9sdJ/qq9QYA4wUlFiik34nFipDK65Lm84Ip7k+dImsc6UJVg1DS7nGe0dHz+HhoZqP3
	 CZASZ2Zw3fmZgZaLkEFXvmElBPrK/si6Reycp2ybntNmWc2xM7Yn/EtoSOxE6jYA2uQkm
	 6IaG11xzuIxOsRsUJoVhwVkw8fWTtlvVBssEmTvY5ATOuyPfdRMF/6krkjtYsB7TFqYLz
	 8t8DCgl7b2M2Q4bM/wmqtQz4cfDkIE4cL3AD4uSv+XPwKwgwsG7XJ1tzc133LlaW/AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cEtlzbFffNbXEfnRfrfQt3jwhoK6waIbjHPV7EqbNas=;
	b=c3nJeJOz+YjMWI293Cw242bZ84F+Fhk5De9iMEEYF5iozqjC7iwlDC0//SWV41d3UPEJ
	 p6leZPiNaiFhbw+od5KsZVtR7InIEUCTc6eZ75Ljr7mqveKXTjcFlMKaT02aO+C0hw8ov
	 t2X7MPFd02EX47LqBhAtdTcIrB/DVmeJfHeQUbKTIV26fMxQ0HL6jHosO1NKRX8XWNnQf
	 gwONlodq+nagCyIGYlJcpNaFN6JoXwJh0dI22ql9jQfrXK17feS3vJF6uF9xyhbv1FcrP
	 wC2Az14NoctKJAa6BWrGtRyWn1ILfXNp8N9dG18ekeLXRs698N5cM3iDi2lu3fLEuDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ANJWtQn0;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E18606A335
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E18606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ANJWtQn0
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1767668a12.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795480538; x=1796085338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEtlzbFffNbXEfnRfrfQt3jwhoK6waIbjHPV7EqbNas=;
        b=ANJWtQn07idnhIuzVfW3nPlfg6xJ5aMg8KP5bLevx3ryF2EWMf5Y2C2WnH6ulnyDwL
         eyV0Rx92s0RCZMZDUL2ElO3Uo4+YC/BngcH6FawYWA+xrCOfKO9bKLQ9mOYbWuLJdHpf
         HRKvwqw581M4r2LNr72lq0FbnDg2OG/qqKnD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480538; x=1796085338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEtlzbFffNbXEfnRfrfQt3jwhoK6waIbjHPV7EqbNas=;
        b=UdusfqaZbF7GrBzy++vsdR8xLdsYIw2DpHq7qIwFBaM/OZzODGFds8XRsX91L2+GYo
         HL9ERQ/LD6Gf+OHgdrqUo4Axqa6EmPyyHD+3nBc7o+JBkyYH9QGYB38jTOBX4yOYuQlx
         8Y/elm++4OnA6vL9EeirI93ZYm9HbBtOJAjTDKfMJSX1yqiHu7OyWQ9VMKWRfp/aLyQo
         72azkR9KGHuopWMwGdofBYl+s0vW03EJKpCrGIT+JGjuOa1lmN6EBfHLtun8uULF/jih
         rvy77tRfp4BAiUOi1z08G86hUw4RbyPeCCHItNWAc0773yLAmhZ5DhvmRVcITpzWi4yI
         TY/g==
X-Gm-Message-State: APuU4Z+NAIjNtFN964usbIPRZ54jeX/2ZlfX5g2+j6t5bOWqmzJ7HXW+
	0+mW7sK0zL8HViaV8CZzyzi477/LZObd5buwqZCec/JnuBvxvJslT8X+eXOW9tLgzxU=
X-Gm-Gg: AZFdTZcQDvBfuxWXy9EtoEHmCyoZ7pbeZrIYb7o0egXl/iYiii56HnPOE34sZ/vGLew
	YJNmTRByEA8eyiQ8Nq8fJ6hypNJyjOKz3KcDtJ2cKcwBaKE77AFGmR+aDTwETCg8JvaRiogn/v5
	E4Guxddti/KlXUcKIbAPLKI3x4P4+uxm0SiXHWl+PuLrzhJQfsvj+VRnH1CMh8vj7VDtAWOVcAw
	X+gLazIdahS3MnVkYdp/oiaNj3jFDC/Ug6D5CaNP31kVjaXav8D94P48Ub0q9zK3tW4UxqCjLj1
	4WGBbyxB3vtR1Uz1D1cmN0997nLY9Hik6OEyfnU/GbqFJaFaA5zHmUl1oUFitB4JZbCvBC24EU+
	tzvY83k+IrfMqoCRqr9Dq3xk3WFWOkpapq8R85r2ix09mLVb+3065ih6DgVq8C9L7ACdA0JqDLl
	Xs13Aiu9xnI58xwIFrU16tTnAbpeJpSLWoJB2GQ3idSF2fh2VL8piuDCQP+ykBouiwmKbvLHsmi
	5C0HSwyi8BFnel8+CPpOPBTCXqSs2Xrx9Zn4032F3oYfQR8vQ6yZGbWuK9EU3hAzggQUdbdD//C
	ASwAWQH32gRWlxbEf3MSfqVJTPxbxtQtW0yd2vHwOVH+xM9j8+9wLieUJoskgFxV7zfZZc/UP1y
	SZ7pBAsFrhfs5PaOhi0px/QC8QHi4FjBLQfs5c+BY9l7EkZABYNZ4VFEcfa0nSfFt
X-Received: by 2002:a05:6a21:9188:b0:3eb:abb7:f92c with SMTP id adf61e73a8af0-4014cb3eed2mr11300988637.22.1795480538338;
        Mon, 23 Nov 2026 16:35:38 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm6076667a12.8.2026.11.23.16.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:35:37 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>,
	stable@vger.kernel.org
Subject: [PATCH wireless 1/2] wifi: mac80211: do not copy the mesh RSN IE twice into the beacon
Date: Tue, 24 Nov 2026 06:05:25 +0530
Message-Id: <20261124003526.78471-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124003526.78471-1-piyus@iiitd.ac.in>
References: <20261124003526.78471-1-piyus@iiitd.ac.in>
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

ieee80211_mesh_build_beacon() budgets the user's extra IE blob once:

	tail_len = ... +
		   ifmsh->ie_len;

	bcn = kzalloc(sizeof(*bcn) + head_len + tail_len, GFP_KERNEL);

but two of the builders that fill the tail draw from that blob.
mesh_add_vendor_ies() emits everything from the first vendor IE to the
end of it:

	offset = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);

	if (offset < ifmsh->ie_len) {
		len = ifmsh->ie_len - offset;
		data = ifmsh->ie + offset;
		...
		skb_put_data(skb, data, len);

while mesh_add_rsn_ie() searches the whole blob:

	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, ifmsh->ie_len);

A blob that begins with a vendor IE therefore has its RSN IE emitted
twice - once inside the verbatim vendor range, once on its own - and the
tail copy runs past the allocation:

  BUG: KASAN: slab-out-of-bounds in ieee80211_mesh_build_beacon+0xe3f
  Write of size 479 at addr ffff88805ca1887b by task syz-executor
   __asan_memcpy
   ieee80211_mesh_build_beacon          net/mac80211/mesh.c:1110
   ieee80211_start_mesh                 net/mac80211/mesh.c:1187
   ieee80211_join_mesh                  net/mac80211/cfg.c:3330
   rdev_join_mesh
   __cfg80211_join_mesh                 net/wireless/mesh.c:214
   nl80211_join_mesh                    net/wireless/nl80211.c:15399

One NL80211_CMD_JOIN_MESH carrying such an NL80211_ATTR_IE is enough.

Confine the RSN search to the non-vendor part of the blob, so the two
builders cover disjoint ranges and their total cannot exceed the single
ifmsh->ie_len the beacon was sized with.  The blob reaches us having passed
validate_ie_attr(), which walks the element chain and requires it to end
exactly at the end of the attribute, so the split returns an element
boundary that is not past ifmsh->ie_len.

An RSN IE placed behind a vendor IE is still emitted, as part of that
verbatim vendor range; nothing that a well-formed configuration sends is
dropped.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was checked by hand against the code, the fault was reproduced on
net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary secure-mesh beacons unaffected.

Fixes: 2b5e19677592 ("mac80211: cache mesh beacon")
Cc: stable@vger.kernel.org
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/mac80211/mesh.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index 8f8814125375..eb54bd98f282 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -379,12 +379,19 @@ int mesh_add_rsn_ie(struct ieee80211_sub_if_data *sdata, struct sk_buff *skb)
 	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
 	u8 len = 0;
 	const u8 *data;
+	size_t prefix;
 
 	if (!ifmsh->ie || !ifmsh->ie_len)
 		return 0;
 
-	/* find RSN IE */
-	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, ifmsh->ie_len);
+	/* Find the RSN IE in the non-vendor part of the blob only.  Everything
+	 * from the first vendor IE onwards is emitted verbatim by
+	 * mesh_add_vendor_ies(), and ieee80211_mesh_build_beacon() budgets
+	 * ifmsh->ie_len once for both of them, so an RSN IE sitting behind a
+	 * vendor IE would be copied twice and overrun the beacon's tail.
+	 */
+	prefix = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);
+	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, prefix);
 	if (!data)
 		return 0;
 
-- 
2.34.1

