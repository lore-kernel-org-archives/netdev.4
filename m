Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480542;
	b=xNyZA1+FHVBeFDByQY4V5TA+gPKmkLz1NGBAUAJa5nNf3W/9p9aNcB+NLAiA/R0tnL4d
	 7eWzMhb523eSFlVjD5Mgfc0sBEoLPi98j4iC2U52XAqPEZn3vCE7lH7MZ0tL7NP7ODbLb
	 k3W6YIbI4AcOHi+A7cZhFdcDLFTwUU9AhRvzgGjf1ZDwlb1YuVCR9y+Xil01lqywjJAAT
	 X5KWOKl2l7uWwHZxbVVnKDEk60ssJught0ydVn4wp57H9LcQFp/g//bw+Olr3TPlHwJlZ
	 dC9ANdSNhqDIT97EOeIxUm5EZmJ4Gw3/pI8UxNR9ASkd0WLPOT/Jq2eTD2Tmd8IODBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r+sRDZEHrgCdILFBOlwZpD0Uy4pTk4kro1/MkEYhJDI=;
	b=Et5apcLdPutkVA7LfQiV16Q5U2LnJL57uRyAquXqKkRyJ/88nqjS4UYx82vWWqumUf4L
	 rBFBBctQqP/PgvIq1aM1L2LJNrjgfSxAtlB9tHYNmk0HQ67pxMvJMLHqhkutc7JGPKZaT
	 /ZEe6RpXLm1tlIiLtoS273xVF6/jefO6GnhXVZUMCswQ2zUmBO5hC1niWHXiC0PVYK/B+
	 CLdBBFVniMtRpiFX5yM+VHJLkPVPNy2X/Kup0NQs/oqwk3oLDkJ2YZdAHZQtwv1ipi8x/
	 gsTpoekcn2SP6oh7/klOFgeVCnIdxqwuhWjJnYRqYYXfn3GbNEloNLM5ULkbNd+GbLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=U89QZLLb;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B496B606A338
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B496B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=U89QZLLb
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f04244c3d0so32520795ad.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795480541; x=1796085341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+sRDZEHrgCdILFBOlwZpD0Uy4pTk4kro1/MkEYhJDI=;
        b=U89QZLLbOz59aD8Y5kR/XtX6j38G64zNPVUntrHhIUGN0iHKJN2mNev+3NSQqxsp/Y
         +zUNVxrmOYZhlvM+nck4tWMaOuqSxIHMFEOBgGfkiUGqVoaw36zfbAIS0G9/zL7tBQwK
         gg0A7xIINvpe6nGUVtF/FxRZNhm6iAL4DF0sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480541; x=1796085341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+sRDZEHrgCdILFBOlwZpD0Uy4pTk4kro1/MkEYhJDI=;
        b=beElj2fboQlqmft+PO1ivkO3kjpNeBF5DVoL48X/CEaljcCoRg6DY2mLp01zzmXo7C
         Z6S9JEHPhvMoCzciM2kejpFr9jPKoiPvUH83mgQzU6pRFvnDCx1ufn6FzVxn6rsA+Ey5
         dLOKUyZN8eD/OzVVNG+4pSM4mxS9EF7CzxHcI8s3BqK0a85NRx4fQlUjKCN5lQIwyINs
         g7Vb6ehbXvdBSclV5HqzhHqaanzLD4W3L2SUIONnICZmmbtCkLFq63EpAL10D4PTu181
         mYJ1USeD3TTeHQkISWYqgXuhKPIdTVyxoHzqNVUIdiiAczgjeEZuTDkzhP5FTdW2nGDy
         pobw==
X-Gm-Message-State: APuU4Z8izmjr695DGZmaJZr6Hj5WAvrwM9N4Xl160apcIKt7XV1BXV4T
	qRHdgnvrV8OHQzkPlPH5kVAq/PKiV8ht7fCIntEJ7U52Zc+/OpSxcZqTaw2DzjETLoo=
X-Gm-Gg: AZFdTZcQlithODtFbQKiz+KViWsaKo+3+MNYwY3s36w4cgK13Qwd5GB3C1reCnh0OxH
	aSupQzGOnUA11VmaUhujRH8m7TwaDhUxQ9l9vZifT98LbL7DKT8FJ97UuhXeS8ce0VYL+gGDXsc
	RdO5nlhes8rxQd0YILsKnivtgoL7H4KEM3Qks9ix/JEw3JcFzFTZAD0pbag/q2TNBk3EmwOT+6l
	84woNcJxRnn13K2ot060qGvJ+uisiGBZvw5dCOwPqZgkxVXQmuiImn9WaRUmm6S+nLFZMR/MUke
	k+hybDsuVrDVny4SjkbqUCvxXyl3dUXvKFPR4JvUKAAqBtiZkyyIzHR721JbpzapN5vRUaJX/i9
	QIasn7bcQ2opbF2vvgWQ4PnMExFMTRjlEDKawaNKNDYksdBIPATzhJKbUWBNZlyFgEy99IyzlIF
	xBYaPug4gfT3EhMSRqnLOQvU2kuDdMCCF3m2xdCgNDonGJI6NoelM4W59HMXrEQmvWXVhjYt11r
	QEPwzaPZ7nkOEWn5E+RIEE954OfRZ8tRAxP774u0BWeH7RYy/Dxu7vIJ63qkhntT1c4oa7ed2F+
	OHtPCmd777I06dgyQI/88mDzQIjG1rLWAEKxFSiT9rNCLbEXliNYVfdB96rP6kXQqTtcGMeWd4y
	RZ01X6EJz72mUH3duU6jhUJ95W5F/1001jY0UE6G5YsWt1XsxiggxKUB8tluXsjWM
X-Received: by 2002:a17:90b:4483:b0:3b4:1877:8d30 with SMTP id 98e67ed59e1d1-3b41cb4fd23mr11751289a91.62.1795480541093;
        Mon, 23 Nov 2026 16:35:41 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm6076667a12.8.2026.11.23.16.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:35:40 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH wireless 2/2] wifi: mac80211: widen the mesh IE offsets a u8 cannot hold
Date: Tue, 24 Nov 2026 06:05:26 +0530
Message-Id: <20261124003526.78471-3-piyus@iiitd.ac.in>
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

The extra IE blob a mesh join carries is bounded by IEEE80211_MAX_DATA_LEN,
2304 bytes, and ifmsh->ie_len is a size_t.  Two places that walk it use u8
for values derived from that length.

mesh_add_vendor_ies():

	u8 offset, len;
	...
	offset = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);

	if (offset < ifmsh->ie_len) {
		len = ifmsh->ie_len - offset;

ieee80211_ie_split_vendor() returns a size_t.  A blob whose vendor IEs
begin past byte 255 truncates the offset to a smaller value, so the copy
starts in the middle of an earlier element and emits bytes that are not
vendor IEs at all; len truncates with it.

mesh_add_rsn_ie():

	u8 len = 0;
	...
	len = data[1] + 2;

An element's length byte reaches 255, so this is 257 for the largest RSN IE
and truncates to 1 - the IE is then emitted as a two-byte stub, and a
secure mesh advertises a malformed RSN element.

Neither is a memory-safety problem: the preceding patch makes the two
builders cover disjoint ranges, so the beacon's single ifmsh->ie_len budget
holds whatever these values are.  Use types that can hold them.

How this was found: alongside the out-of-bounds write fixed in the
preceding patch, by AI-driven fuzzing built on top of syzkaller, then
checked by hand against the code.

Fixes: 2b5e19677592 ("mac80211: cache mesh beacon")
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/mac80211/mesh.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index eb54bd98f282..4ab776e174d9 100644
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
@@ -377,9 +377,9 @@ int mesh_add_vendor_ies(struct ieee80211_sub_if_data *sdata,
 int mesh_add_rsn_ie(struct ieee80211_sub_if_data *sdata, struct sk_buff *skb)
 {
 	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
-	u8 len = 0;
 	const u8 *data;
 	size_t prefix;
+	unsigned int len;
 
 	if (!ifmsh->ie || !ifmsh->ie_len)
 		return 0;
-- 
2.34.1

