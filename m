Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.216.20.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745182;
	b=b6TFt4Ya25xObN2wDwqERTcu+RVYjsA9EnyRdlQz7N3lGEkiNXgtU/2XYWXF+EhvYrW+
	 b3s7pXZoNIj/JCeBh39qit0fKjX0At89OFw5RDPRa6cJch4j+YvgkV/L24hicUsKgf0B7
	 0xJL2Pr4/AKtMMJWepcouOs7TvUcpDI75cabUcePC7DRTXCV9rom6R6d+jjpHddEbViLV
	 +zO/aaUCq71C9eQGALkRPvuQH/RJ4OiaLKvBGPeU9pRfd/0eiVZgZqo7Lx7ykuSIaoDT1
	 /LTktwRQg6wTKxZ8ytpa79n+OlB+VJrBcgxibrcSorrNBS1V5mY4Rvn51AKJPTNggEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745182;
	h=DMARC-Filter:Received-SPF:Received:From:To:Cc:Subject:
	 X-TERRACE-DUMMYSUBJECT:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-TERRACE-SPAMMARK:
	 X-TERRACE-SUPERWHITEIP:X-TERRACE-SID:X-TERRACE-CLASSID;
	bh=/0mhPj01jYciMNIS3v4D8R62f4Kv27ZLnnjl8phcSXY=;
	b=2WIaG9/AbQ0cD0gixC+XEfwREUNlAIbYikodifixLgyJTbqSlvpFjDp/BKRr1MsQhjgQ
	 cZ9ayRCSXBhBh24iNFlWUPm06pNo7c3BTgea48mJmG4/dsDO8msEgUPhtQP5NQ/zyiuXL
	 23jISfq3OcLy1YaO/WOPeLljvaJU9he9NgO1JHvRnitXO/ysuJH/Q2YaayjYWKuVR6fOq
	 V9dTwK65GQZw5/HpXRptSap5OIBdQlQg93OQUjYGulDV4gV8sXciGghLTQ32CMOKDd62J
	 y1D2kW3jj74j+pWN4KpWP0EAJIcsZjRY7CSR6/SGx87yApoZNTimuhTfAmHrO/flK6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pribit.com;
	spf=pass smtp.mailfrom=pribit.com;
	arc=none smtp.remote-ip=35.216.20.220
Received: from prod-dose-smtp-3.daouoffice.com (prod-dose-smtp-3.daouoffice.com [35.216.20.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51C0606A336;
	Fri, 27 Nov 2026 02:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B51C0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pribit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pribit.com
Received-SPF: SoftFail 
	client-ip="106.245.249.210" envelope-from="his1415@pribit.com" 
Received: from [106.245.249.210] ([106.245.249.210]) 
          by prod-dose-smtp-3.daouoffice.com ([10.37.10.10]) 
          with ESMTP id 1795745089.365151.140503668266560.prod-dose-smtp-3
          for <>; 
          Fri, 27 Nov 2026 11:04:48 +0900 (KST) 
From: Hong In-su <his1415@pribit.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sd@queasysnail.net,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	his1415@pribit.com
Subject: [PATCH ipsec-next v3 2/2] xfrm: add ARIA GCM support
X-TERRACE-DUMMYSUBJECT: Terrace Spam system                                  *
Date: Fri, 27 Nov 2026 02:04:48 +0000
Message-ID: <20261127020448.55891-3-his1415@pribit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127020448.55891-1-his1415@pribit.com>
References: <20261127020448.55891-1-his1415@pribit.com>
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
X-TERRACE-SPAMMARK: NO       (SR:12.67)                     
  (by Terrace)                                                  
X-TERRACE-SUPERWHITEIP: pribit_com_packetgoOS
X-TERRACE-SID: 1795745089.365151.140503668266560.prod-dose-smtp-3
X-TERRACE-CLASSID: Terrace Spam system                                      

The kernel crypto API already supports rfc4106(gcm(aria)), but XFRM
does not have the corresponding algorithm descriptors.

Add XFRM AEAD algorithm descriptors for ARIA GCM with 64-bit, 96-bit
and 128-bit ICV lengths.

Tested with strongSwan using 256-bit ARIA keys and all three
supported ICV lengths.

Signed-off-by: Hong In-su <his1415@pribit.com>
---
 net/xfrm/xfrm_algo.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/net/xfrm/xfrm_algo.c b/net/xfrm/xfrm_algo.c
index 98ef2c48982a..d74f86d4e672 100644
--- a/net/xfrm/xfrm_algo.c
+++ b/net/xfrm/xfrm_algo.c
@@ -82,6 +82,42 @@ static struct xfrm_algo_desc aead_list[] = {
 		.sadb_alg_maxbits = 256
 	}
 },
+{
+	.name = "rfc4106(gcm(aria))",
+
+	.uinfo = {
+		.aead = {
+			.geniv = "seqiv",
+			.icv_truncbits = 64,
+		}
+	},
+
+	.pfkey_supported = 0,
+},
+{
+	.name = "rfc4106(gcm(aria))",
+
+	.uinfo = {
+		.aead = {
+			.geniv = "seqiv",
+			.icv_truncbits = 96,
+		}
+	},
+
+	.pfkey_supported = 0,
+},
+{
+	.name = "rfc4106(gcm(aria))",
+
+	.uinfo = {
+		.aead = {
+			.geniv = "seqiv",
+			.icv_truncbits = 128,
+		}
+	},
+
+	.pfkey_supported = 0,
+},
 {
 	.name = "rfc4309(ccm(aes))",
 
-- 
2.43.0



