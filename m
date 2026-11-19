Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126287;
	b=fqonAhGaAgxkXoJPXPgMIpAXuEes2DIOIFl4IdMvHtFoNPWWZGnG5jAJga6Mkvq+drli
	 tpfLsJCzr0+GU2O8VueTId1xCMowpphochgIWkpDgAcO+qXO/8SICl02B2DGe8Iefv/o2
	 0EGlMhe+LvCWPFFwgR6QPwufiwNHFKD4Ex4mzCO+mZa+q6JPYehiD2LdwTmVDEIAOXmxU
	 v0TqRKccCu9uZr0BHf9M0uqGCVFXgKkMr5eqVN2aTkF+hIhAqoPNMRgTdDSFwGfoWlIxO
	 778nFWB4ORsIOTdWyFr0IU+BJ/OkIcdyhAR8eltJbq72ewp24xmfEmOhLXI1nd4bgUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qLh4aUJqmORmxkcDRMZgfRmKl5hikmEYKSvZGKh0lKQ=;
	b=Dt3XaGdn2tsNSL4z5qT8emW1leMAxqui7wPsdaL5GRSq+hrEvsUgJZCwd4Gttj0ZPw2n
	 qtxAF67I0lgbMDcEXltZHaJ93AaM7K4wartWTarRiBqodKgmtKwmc6FS80lwYVIrKGmPo
	 SRY2jf6kKOGAFMAoWpv+YSF1OIjFBAAmV1NwZ4jX67iEoVRMMEQujyLdwMM2NFTKXhO46
	 X37H7BzreN9AxD9ztNjtoqm4j78+JsLAjSHBT+lJRZG+RBz3deF5gvt6f8mspW2zDZci+
	 uekHkWjDTU3Pf2Bq+q3T+E8UveD34lxxsEG9dkHP77E3+YE1WP0pvm+Tg2oaMUOJkCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCatNYfJ;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09641606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09641606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCatNYfJ
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cddee4abc57so80589a12.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795126286; x=1795731086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLh4aUJqmORmxkcDRMZgfRmKl5hikmEYKSvZGKh0lKQ=;
        b=iCatNYfJtysucPJs1gycSsLSuBZqUiu4jLP/5Oi/ZlSprpb1ljJAlNdFyS51uxclpi
         CvFpgq8+PfqsDYqy4C5jpPfIlFcr4hoq4vKuEAc/mTtgId4fsTr6EXi0c6D1zuJYHDsK
         xjPm9jwkLPrI9oFt7V0ecF7rxx6n8+ZyEWH84HCYzyPGPCtgT8X3852ZFXPN+JBSFwus
         uMqP5K3tzkwjpLq7B+V89ItkPGFsEQGGCjid0aDc9X4CLW4SoWnx/ZrlRJOQIZ3nVyp7
         HhnzkUsID5XbIqaRHC05EiMl9S2jVaGChK1+p+X9iYBXrUoulUfvTqvzG9ecanvPXgzu
         TQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795126286; x=1795731086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qLh4aUJqmORmxkcDRMZgfRmKl5hikmEYKSvZGKh0lKQ=;
        b=mgl/BY4bKDO59687libUXegGupXZTUbEzKiSFcR/fyRixwQlS+DdTfI3cmQ54d0qcn
         /catWBohSp6Vgu49QN89d3Ciy8OrE2gO1c3U1YZBs0RNAMGXNEOF8mjW17X1ovaCYZCn
         9ueeL4+TeeoMeR5dZNtVq3R5Nt3fW06McaQ7/YPSu9GjQydYFEm/GJgb7lhgM9iMlsmh
         2k4GWkOU7G40ihiiWLKBAx2pH+dcoA4exfPXFZXKZgPap8NnVdlRPnLm5UP3PXf0B4kq
         il3F4nqJ+1VM3ZoWk0IGtUW4ti0FbRonwrVRYF28GChwobSxTIPtoUbCwVF+6DqmDA5L
         Vxrg==
X-Gm-Message-State: APuU4Z997YD5QkPJwVE8mJkRKL9TtNnFQx2lZIcL1q4qEOz7BYDxibBj
	AOEdE3XEfSU3yWR6uPcrKYPxLxsI9uDReiLwspLWpQVT1PZymxMNrlSWua7UJsK4
X-Gm-Gg: AZFdTZfKF+EPliNCUzgB1tzIYmiNCXDTGgrhTQuiIYo4dddPe3IK9xmXJRc5vDpx+3I
	+YpYtkZfY6Uxd/HHMZyvPI35y+KylWuo12GvFkvlCR6ArmHg7fDainfeyDlMa9jvaySsZb6EKgO
	CmOixoZK2hHQOsszQD/kudhs+1pWeXm2YJML926S9zG/Gl5iaMrK6cmg7Bzcz8hLaYRLicrnJH2
	b2PZ0z7Shxz/OlOEIpxVusmlFpDkvSLPo6BOrVjGn8Fk1O+1b5f9RFDCqnLzAYJ27Mp8kRA9ECn
	ezRoRs8IU1Uxaq7eGT08mSc895FxrlSEne1q/JvRCtaRtuUJL3lm4AI6w+wreIJv3idm1bUUInb
	tyu1AirrfK+i12waRjXPxMlKey+Pxf7MCxXlUtOdNMvaExXElzj6VrrqVRyWF2Jl3SgBt1Z1nz2
	1dC1CkxsqtyeiF82D27bKxy9nJlJkqcUu+/A7XD9BBSK2/TtfV6CFh85RMxMHPDKCv5UdOTHMVI
	zenXBdbuiw8+lvW1z2Vkrenufb5LorRu+XKBJeBaz0BXENQ/++UW33elI5Ivwnrk1L2Pk5klOH4
	hUTnG8joIth3QhiJNc7cVi25yOyVxuMnF/lVWJM59xIz4PLybRkH/zoNSJwb0G3Bd3268Isctw=
	=
X-Received: by 2002:a17:90b:2b90:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3b41c9b1efbmr634967a91.62.1795126286254;
        Thu, 19 Nov 2026 14:11:26 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d243eb1sm369348a91.3.2026.11.19.14.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 14:11:25 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net v3 2/3] net: dsa: motorcomm: Do not inherit ports from dynamic FDB entries
Date: Fri, 20 Nov 2026 06:10:42 +0800
Message-ID: <20261119221110.1123578-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119221110.1123578-1-mmyangfl@gmail.com>
References: <20261119221110.1123578-1-mmyangfl@gmail.com>
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

When adding an fdb/mdb entry whose (address, VID) key already exists in
hardware, the existing egress ports were silently merged into the new
static entry. Ports learned by hardware are untracked by DSA and can
never be deleted. Replace the port mask instead of merging when the
existing entry is not static.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index eddec2f26586..5bfdac18c012 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -799,7 +799,10 @@ yt921x_fdb_join(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 
 	ctrl1 = val1 & ~YT921X_FDB_IO1_STATUS_M;
 	ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
-	ctrl2 = val2 | YT921X_FDB_IO2_EGR_PORTS(ports_mask);
+	ctrl2 = val2;
+	if (ctrl1 != val1)
+		ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
+	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(ports_mask);
 	if (ctrl1 == val1 && ctrl2 == val2)
 		return 0;
 
-- 
2.53.0

