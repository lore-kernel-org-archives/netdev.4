Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554307;
	b=kJ/XQjdYWLk+BrIy689FYKOwHYeG5Zub21MkNd71HsPuZahb3aS9ZiFWZsrgDKjVreiX
	 j0+OurmURWoK/3iUNoATOl4Cu4NOeqjYo8q6qLp83M+qsnuRMAq+xD6dGwZp+sNGzR10T
	 0T+QWtN4viWPly3/btl0pzGHLy+tiK7PQlWacjlMfwo9ynPBwf9td93OCO4NXMMnCddVS
	 sDDymz9G3I2eoJ1mTXxdkg6N1m5GJg1lBePcbez4iNahT7xZpKSHls2NeXFVaL/6EzoJa
	 jq+KtxiFVNffVDju83UO2B0xBtiXLiLq1wg9dA/Dt6Cs/BDQh8J86AUZqJfXgTZT0/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UmA2umeLZrbw/WzpeTlK+rLisE0ZHQXK9KgTiLSI5UQ=;
	b=K0F9uwKu66gAvh/wMLYjnuuzVE2ixD03mEal4qO/9esu5H4sqXwd+hTTJZAOYog1+cZ4
	 emO/gZq11irfHyuGmwIMXKhTubEIjLU5oL5bcdHcJ69bap1Hu8k9OM6MFc4Cn3ggka+rw
	 1B1nzrrPvfEd6q1BiOwA3LrLre45yA+eDRpNXhUpp8PN9arsCBNZQsvVpmuumQHWHEGPu
	 SzouVHvh3jXVGVJK8UHq04so2OLLOAT2qfpy4K0Uvz02j3OIeh6kKUdROKaveolCcqpw/
	 wf/idu1OnOPDn/+7HIKS0tYOxwUoLi0mnnPN0qDwlc4qLA/HFNzI221a9uJhwOJmBAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=pLN0dEUJ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9621A606A681
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9621A606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=pLN0dEUJ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38431138772so6436336eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795554306; x=1796159106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmA2umeLZrbw/WzpeTlK+rLisE0ZHQXK9KgTiLSI5UQ=;
        b=pLN0dEUJsTDnVw+3dEKjTxvx4nnyo4iT3CkdrQD4cCNzoGPlDM8cNc64o9/bCGe1pl
         gZ/yPeHtZW09V+9a5knWliWmIhhpjUC4Tx8CepqV2BGZ6p12MxNf5IvqkwB9PhuAp0Da
         68rFiEHSeumPYo/funN1/bZCBrCsbjoJdAzhB57UPjtyAHgEO36UsqNf63tNvoOZaIBz
         aupa7y9ovlYbXrbEkWcPDO6/ps0NCHX9dwUcYgaM6tlNVZG4MDFOF3OBPsHmzRypKAer
         lcBZVcA1ghDtGzVha4x/aLXXXbuI1jCcQE5SdsxZ4p2o+7LcUOTpsBDswOQfG+d33VX/
         McCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554306; x=1796159106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UmA2umeLZrbw/WzpeTlK+rLisE0ZHQXK9KgTiLSI5UQ=;
        b=HHutOSUQK/7t5QoiPnqxjp+s3liRnAeqSN1gcniOe2gylgCEwYe4KCGNw3/KxwZWPj
         k3hn0HUQXsPoN2jIwa+DbwLQzUaA6iRjKqf5tDO+yBKKPRPNCigJFdwaeFRvZ4nPeCOX
         BluLODjYWE9ew55t3CywqCDzwBt7WNdDLGHDh40yLmDGWYtXLDhuNcSRK75S4oroXH8X
         LDI5bPb22eQIc3e3jKnIpBZRAdMsuFzQ2MVOc04j7VN46fQmV0ZgnO13vjvV68c9KVNT
         U6VIuw4i2RgT2V7qcPBeY5W7xWU5EKbOAk4f2J5UZ5Lh6k1t5cvHv3J5Bp9WZ29WTUWk
         2TFQ==
X-Gm-Message-State: APuU4Z//kmujfI3fq6vaPIujErrc2TmM4CoGX10XC/d/xNoGZrypsUGE
	ugYhJEVq0XYQi79CEySVMuHKWRRYMU63JoBXx5qgz838Hu8Kqdi8eA11c7xQox4Bu9w=
X-Gm-Gg: AZFdTZdCeT6nUHANi5w7J80dnC51y/2jLX+5fTlkkC+wvfWwWflDTgaPp0IjMBVppcB
	c174ZcU+hdON7kLS9+CUAyfHuf7bXHAXMAW79je9m3gv6WY6ntSY2E9nd09nAJK8L84RESfDmzF
	NBV1P5UbP/N1d6UnQP1OuV9XCkUjTKj60Yr5GVC0DSm1KTcJiHBPCCyB5YjhIKbwsf6FSG2wMSf
	O/qbhfBYgxfLg/HOneakO4Vi73RhNds2yvtCxZkoyXkfEo8WMKDwiLfs/fSFBVj/WoOEz61MAcG
	Nq6ZhHlPqeqd39YEbZcf2vP3enmr9iOwt3NXAJ9MLLcXLYydrtWNT0+6CiLXs1dK5cH1FJ5M5aL
	/PUBKiP/XZ954Pbd9uO7y5W2bRQVs0zC7Zj5GViPrfToDlSm2uiMoDwlLgPw0VS5KhU9cD8xQ89
	/jhWtuVNOKM9MOk42bg19V0MlkmuxxapFxPHWqBOZj1DSjI/ObbvDpjKkNmVppY2xZmcleIjyT+
	jvjnsMjPE+tZYRWpmy4G4aicH4ANCboFxxVNqcyzVo5lMu/GRTvGB8ycNGS3GerBlfXygzPvXzK
	mSTJps3QFY5SoJOxLALLL8Y15+CCTradp3owDsZH3ovhPHYc/dddL/3mYEEm/2eFDfcOfLrczix
	/ra+mH9tmRylGMYNe4tt6JguIpRZosnl7XtSqzGYgyHwJwS0no1w=
X-Received: by 2002:a05:693c:87da:10b0:386:aaac:7017 with SMTP id 5a478bee46e88-386aaac73a6mr8299966eec.26.1795554305617;
        Tue, 24 Nov 2026 13:05:05 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm5577813eec.17.2026.11.24.13.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:05:05 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v4 1/3] amt: make the A-B source walk linear
Date: Tue, 24 Nov 2026 21:04:59 +0000
Message-ID: <20261124210501.70394-2-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124210501.70394-1-omar@blockcast.net>
References: <20261124210501.70394-1-omar@blockcast.net>
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

amt_lookup_act_srcs() computes A-B, the sources of the group's state that
a received record does not name, by comparing every source in the group
with every source in the record.  That runs under tunnel->lock in
softirq, and only the packet length bounds the record, so a single
Membership Update can already cost |A| * |B| address compares at the
current 128-source default.

Mark the group's sources that the record names with one hash lookup per
record source, then act on the unmarked ones in a single pass over the
group, clearing the marks as it goes.  The cost becomes O(|A| + |B|) and
the result is unchanged: a marked source is skipped whatever its filter
state, exactly as the pairwise compare skipped it.

Found by review (Sashiko, on the limits patch); not triggered at runtime.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 43 ++++++++++++++++++++++---------------------
 include/net/amt.h |  2 ++
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index b145ed3..79d68bc 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1649,7 +1649,7 @@ static void amt_lookup_act_srcs(struct amt_tunnel_list *tunnel,
 	union amt_addr src = {0,};
 	struct hlist_node *t;
 	u16 nsrcs;
-	int i, j;
+	int i;
 
 	if (!v6) {
 		igmp_grec = grec;
@@ -1705,28 +1705,29 @@ static void amt_lookup_act_srcs(struct amt_tunnel_list *tunnel,
 		}
 		break;
 	case AMT_OPS_SUB:
-		/* A-B */
-		for (i = 0; i < amt->hash_buckets; i++) {
-			hlist_for_each_entry_safe(snode, t, &gnode->sources[i],
-						  node) {
-				if (!amt_status_filter(snode, filter))
-					continue;
-				for (j = 0; j < nsrcs; j++) {
-					if (!v6)
-						src.ip4 = igmp_grec->grec_src[j];
+		/* A-B: mark every source of A that B names, then act on the
+		 * unmarked ones in a single pass over the group, clearing the
+		 * marks as we go.  This is O(|A| + |B|) rather than |A| * |B|.
+		 */
+		for (i = 0; i < nsrcs; i++) {
+			if (!v6)
+				src.ip4 = igmp_grec->grec_src[i];
 #if IS_ENABLED(CONFIG_IPV6)
-					else
-						memcpy(&src.ip6,
-						       &mld_grec->grec_src[j],
-						       sizeof(struct in6_addr));
+			else
+				memcpy(&src.ip6, &mld_grec->grec_src[i],
+				       sizeof(struct in6_addr));
 #endif
-					if (amt_addr_equal(&snode->source_addr,
-							   &src))
-						goto out_sub;
-				}
-				amt_act_src(tunnel, gnode, snode, act);
-				continue;
-out_sub:;
+			snode = amt_lookup_src(tunnel, gnode, AMT_FILTER_ALL,
+					       &src);
+			if (snode)
+				snode->sub_mark = true;
+		}
+		for (i = 0; i < amt->hash_buckets; i++) {
+			hlist_for_each_entry(snode, &gnode->sources[i], node) {
+				if (snode->sub_mark)
+					snode->sub_mark = false;
+				else if (amt_status_filter(snode, filter))
+					amt_act_src(tunnel, gnode, snode, act);
 			}
 		}
 		break;
diff --git a/include/net/amt.h b/include/net/amt.h
index 9ba0971..f36efcd 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -287,6 +287,8 @@ struct amt_source_node {
 	struct delayed_work     source_timer;
 	union amt_addr		source_addr;
 	enum amt_source_status	status;
+	/* Scratch mark for the A-B source walk, under tunnel_list->lock. */
+	bool			sub_mark;
 #define AMT_SOURCE_OLD	0
 #define AMT_SOURCE_NEW	1
 	u8			flags;
-- 
2.43.0

