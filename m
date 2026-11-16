Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844935;
	b=F39Uq9J8Co3tnAv0iNzrpkiPBq4/RtJ/8IQ48rY+UOfSlfOKqiuHzegzypVjcqYnTYGu
	 fg6hgZIaCPo0w6LlN2fYjBTWa0IGMNl1XfUE4UfRseEJ/jHcz424kTngzj+hYxJahXh4y
	 OO6y4MN0N5It+b9DWnQxX4E6vsANkbf0cC8g5IjOVueL45QU/K8bPvMVEWZK1i0bTWVhx
	 3aQBY0Ga29sC0OtJgucv8Q83hHG2NzzvLlfRvunxnGLDnT7j85Y+lUGFIQrBY/WiVLS9m
	 rT9JiFtruxJ4WRId0VT0j5Q9JqZQLFaD4zQqUHJHPoNyle2/GDfEr0V46IxFkFeSvXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pAz0bLJkbkGyi8jrsmRIgtv7CQJzhkJpuiznWq3FIm4=;
	b=ddaGd8GmUf64iJ6dBS/98Yb6wswzab3HJFV3AMcSeR4H3HkzyyojH5ou9m1IGUFMVSjt
	 KdHDSoWoboZWBlkMdUT8BnN3CBXw1lwVNprvdcldq587nh45SX6i9m+EhNujmx6Z1b3Ax
	 NQCGgDOT77t/m0UeNzXWUfvB0m04S7Tfw33tsh+RW+7nXukex5kGQ5oWGv38EakvM2VGr
	 ZWOWYJQVvJk8x9cbETY5VPeuPPUHPlNVexP+Bq7H7OZ9z7HhBzvdgoggHgZV8IQuIbbW+
	 So0Ir358oyznrj7HLqZnFpUnudKS+7qxMuuc7xXHg8RipFJlVEh8ZtU6ZXUSxbbLzrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jiR3u392;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E68606A32F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E68606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jiR3u392
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1615839a12.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844934; x=1795449734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAz0bLJkbkGyi8jrsmRIgtv7CQJzhkJpuiznWq3FIm4=;
        b=jiR3u392bMbw0RoiMCnm7KG9uE35Hr1IM3HtBgOElXWwMsPJ26QjGfBjm48o1SYO93
         KoVHDTEvaGaDKeocvtrZkJA2bGFzGxrsxIoB47GFvR5vPAamGOWvUMjJHMqSk/eOzSvP
         C21II2c/x0PIlEprS6Vsnw8odj2Qovh8n9x2yp+WD0cLsniuXoI+PS4yXHwv37I41VrN
         R0zcpq+XTQR52/b4UQXMgB2EeHWKwl2AV7kSkNiV03+b+BcPYymjbq1DxeLYywije9PA
         KCS7Ps36l8sODZfeSR65bkUF3hVRitB5kWQWim/ujjaQW03lCYOljVd3+O4RuXcwiM7H
         tDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844934; x=1795449734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAz0bLJkbkGyi8jrsmRIgtv7CQJzhkJpuiznWq3FIm4=;
        b=QPE5AVjiSyQ2maDfD+mXP4yyN88KZs+zBvUhBaRy3xd60AqhL4imM99VScfdmK19a/
         Z9ZkJgamkfkyzmOBoNt/OH11IUNA0CImGkvHxBb7gTMvkg6epQu+NFuPbvyFp5FowzeJ
         fhf41YdPtFkgk0PZXpTBaSWJbRo9eT85J+DookuW2ls7YquOOQITGdcALdJl/o+VOz7R
         1Hi1PK80cV/YrOfOm1GLpIyXIjqFOAigEywdPbnPu1TMF0chlapb3TuzaFswZmv/eFHk
         r0cOIz8cocprAVoy8XvEPUiNBgvHTvS9je4sWQiPXkDP1RT24/bYn+m2jqjc9YWMZhaZ
         aCVg==
X-Gm-Message-State: APuU4Z912IskTWLz7hdpNQtzH6z73c1sNK1+WrM2E3fG3Ynej8Nykjxl
	iEycOlVxKoFnkDDmSEOZ9WoLQooUwEUx+rNRS3SXXQpeJardRclUCGtHqEjjTA==
X-Gm-Gg: AZFdTZd1NvZ8mzG+ma2MI+ctT5tAvgBzytPu81UXPiUv0KO6Le9iNwd0snHHS9j6fOk
	y2NdI8HiRL6KUqdCoar+d03Jo10epO70bi9oRumfQraL5KN05xT21DIQ3DRMuetynjG1tnHs2ff
	sgn/+OVM9RhgZRu9dw2rastZPS+EAW2zzypdakfYLL7E1+ifNlQE3sE1YmKcVDmQWLAwhnWeH3h
	b0gZP2HYe5AEeDDPCggwgbqqp9XsqQlRW7hQkl6xjwBjFFDV1XbVHW4xoKTpAHLmIcSjh7DuGax
	R8VBT9FUdxfQhODsSokSJBs1CZqbnDX9qrBvwdNQyWvxcKGkb16rP70FHgOsRSLSK6n1x2cTY0H
	Q177dx6gIhZ5WkZaJoOpxAHRzjVfebz0L91H1dt6abKG/jdx/3Xg4pe3c4vSiR8cGod84WpCD1i
	pjZp8mNOgEI51JDw5M8u0+sDhVH9acz0uOXURz0nCb2LPE2Yb1b2qFjhjD8cZxBA7GybYmLJg+U
	7IppHazviCD1RasuedX/m4EFRz+4uKIY3pP2xnYjuk71qt3nBwhVK01wcSHcBN+Efpr9OuYE46A
	76ZFnSbZecnc1ywg+mTa2fAo3Q1mr4AcKvfnym6Jwn0wQV/f3qtVYnE=
X-Received: by 2002:a17:90b:2e0b:b0:3a0:e1f7:9b04 with SMTP id 98e67ed59e1d1-3b1b09f3b6amr11067625a91.12.1794844933552;
        Mon, 16 Nov 2026 08:02:13 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm17432051a91.2.2026.11.16.08.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:02:12 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 3/4] net: dsa: motorcomm: Read the port PVID instead of bridge's
Date: Tue, 17 Nov 2026 00:01:03 +0800
Message-ID: <20261116160107.1351198-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116160107.1351198-1-mmyangfl@gmail.com>
References: <20261116160107.1351198-1-mmyangfl@gmail.com>
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

The driver passed the bridge master to br_vlan_get_pvid(), returning the
bridge's own PVID (VID 1 by default) instead of the configured port's.
Query the PVID from dsa_port_to_bridge_port() instead.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 863ebb6c3198..d84d863080ce 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -952,18 +952,18 @@ static int
 yt921x_vlan_filtering(struct yt921x_priv *priv, int port, bool vlan_filtering)
 {
 	struct dsa_port *dp = dsa_to_port(&priv->ds, port);
-	struct net_device *bdev;
+	struct net_device *brport;
 	u16 pvid;
 	u32 mask;
 	u32 ctrl;
 	int res;
 
-	bdev = dsa_port_bridge_dev_get(dp);
+	brport = dsa_port_to_bridge_port(dp);
 
-	if (!bdev || !vlan_filtering)
+	if (!brport || !vlan_filtering)
 		pvid = YT921X_VID_UNWARE;
 	else
-		br_vlan_get_pvid(bdev, &pvid);
+		br_vlan_get_pvid(brport, &pvid);
 	res = yt921x_port_set_pvid(priv, port, pvid);
 	if (res)
 		return res;
@@ -1102,16 +1102,16 @@ yt921x_dsa_port_vlan_del(struct dsa_switch *ds, int port,
 	mutex_lock(&priv->reg_lock);
 	do {
 		struct dsa_port *dp = dsa_to_port(ds, port);
-		struct net_device *bdev;
+		struct net_device *brport;
 
 		res = yt921x_vlan_del(priv, port, vid);
 		if (res)
 			break;
 
-		bdev = dsa_port_bridge_dev_get(dp);
-		if (bdev) {
-			br_vlan_get_pvid(bdev, &pvid);
-			if (pvid == vid)
+		brport = dsa_port_to_bridge_port(dp);
+		if (brport) {
+			br_vlan_get_pvid(brport, &pvid);
+			if (!pvid)
 				res = yt921x_pvid_clear(priv, port);
 		}
 	} while (0);
@@ -1139,19 +1139,19 @@ yt921x_dsa_port_vlan_add(struct dsa_switch *ds, int port,
 	mutex_lock(&priv->reg_lock);
 	do {
 		struct dsa_port *dp = dsa_to_port(ds, port);
-		struct net_device *bdev;
+		struct net_device *brport;
 
 		res = yt921x_vlan_add(priv, port, vid,
 				      vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED);
 		if (res)
 			break;
 
-		bdev = dsa_port_bridge_dev_get(dp);
-		if (bdev) {
+		brport = dsa_port_to_bridge_port(dp);
+		if (brport) {
 			if (vlan->flags & BRIDGE_VLAN_INFO_PVID) {
 				res = yt921x_pvid_set(priv, port, vid);
 			} else {
-				br_vlan_get_pvid(bdev, &pvid);
+				br_vlan_get_pvid(brport, &pvid);
 				if (pvid == vid)
 					res = yt921x_pvid_clear(priv, port);
 			}
-- 
2.53.0

