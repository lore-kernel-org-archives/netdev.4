Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.216.20.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745180;
	b=1SsxGClAmPLDW4RHNT+5r7XFMwDF4w1j4Fss+WrGGEhaqAU7qtjbEPmPb5YzP8iUGHnI
	 S132jRRCx1VgykPgZeCbcXAmjxMF+1fnjGDN8K+07RiJjQFivbFIENW5bo+IQ1nZ7cuhy
	 8mDH+7p5hWAn9PgsMEMYYVqVN1TZPet0p9prHhOTKgPNBCHnlpJo9I+DQ1ZzEjTWoQRNn
	 7DB53kVUsAfA6V55W65xr3addgFAw2nxwC0oswRuP67YktYZg3vbmMz9ouvITMSqHbJBQ
	 forp+MK/QAqdQNX7dKSNau1s9gfmjIHcA95ElwoshP/s3kvqo8YW+/w2enliKggf3QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745180;
	h=DMARC-Filter:Received-SPF:Received:From:To:Cc:Subject:
	 X-TERRACE-DUMMYSUBJECT:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-TERRACE-SPAMMARK:
	 X-TERRACE-SUPERWHITEIP:X-TERRACE-SID:X-TERRACE-CLASSID;
	bh=1KQwmcwphZq919r47d7b00A/kdgyKtkTtdtloI9GrsI=;
	b=lCcEaZbKpU0iXGp6GIULlnqkTx/1k2qB5fQ10EfnT1/lfhZwJA0/J6fi9/O4YFk/VaLz
	 YX8Zr1aey5ozRi9DMbTv1Tqv/CKzYFkEqT3gomEeNBlpNQQemkci17xbYokieFBKWYLz0
	 ucs5REKUS2L6droB+2MjvSkI8e70M75+DuDgVvM5agh6kU8+2+i86SeyTnH71Bwj0wG4d
	 RyPzXiqdvwByG9Ng2t0A8HQ4B//SAABFfa2/uhswp/wuBWTdwnXoHsu9ZH01neVKFsfDZ
	 UjbJxCZEA0CN67rjORuSUxbdjK1Eq98Ra6626baFtkboKRWIhHjb4c1KOAgmIE193Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pribit.com;
	spf=pass smtp.mailfrom=pribit.com;
	arc=none smtp.remote-ip=35.216.20.220
Received: from prod-dose-smtp-3.daouoffice.com (prod-dose-smtp-3.daouoffice.com [35.216.20.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6F8606A321;
	Fri, 27 Nov 2026 02:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B6F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pribit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pribit.com
Received-SPF: SoftFail 
	client-ip="106.245.249.210" envelope-from="his1415@pribit.com" 
Received: from [106.245.249.210] ([106.245.249.210]) 
          by prod-dose-smtp-3.daouoffice.com ([10.37.10.10]) 
          with ESMTP id 1795745089.89229.140503668266560.prod-dose-smtp-3
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
Subject: [PATCH ipsec-next v3 1/2] xfrm: add ARIA CBC and CTR support
X-TERRACE-DUMMYSUBJECT: Terrace Spam system                                  *
Date: Fri, 27 Nov 2026 02:04:47 +0000
Message-ID: <20261127020448.55891-2-his1415@pribit.com>
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
X-TERRACE-SPAMMARK: NO       (SR:11.57)                     
  (by Terrace)                                                  
X-TERRACE-SUPERWHITEIP: pribit_com_packetgoOS
X-TERRACE-SID: 1795745089.89229.140503668266560.prod-dose-smtp-3
X-TERRACE-CLASSID: Terrace Spam system                                      

The kernel crypto API already provides ARIA implementations, but XFRM
does not have algorithm descriptors for them. Consequently, ARIA cannot
be selected for ESP through XFRM.

Add XFRM algorithm descriptors for CBC and RFC3686 CTR modes using the
existing cbc(aria) and rfc3686(ctr(aria)) crypto algorithms.

The CBC and CTR modes have been tested with IPsec using strongSwan.

Signed-off-by: Hong In-su <his1415@pribit.com>
---
 net/xfrm/xfrm_algo.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/net/xfrm/xfrm_algo.c b/net/xfrm/xfrm_algo.c
index 70434495f23f..98ef2c48982a 100644
--- a/net/xfrm/xfrm_algo.c
+++ b/net/xfrm/xfrm_algo.c
@@ -512,6 +512,32 @@ static struct xfrm_algo_desc ealg_list[] = {
 		.sadb_alg_maxbits = 256
 	}
 },
+{
+	.name = "cbc(aria)",
+
+	.uinfo = {
+		.encr = {
+			.geniv = "echainiv",
+			.blockbits = 128,
+			.defkeybits = 128,
+		}
+	},
+
+	.pfkey_supported = 0,
+},
+{
+	.name = "rfc3686(ctr(aria))",
+
+	.uinfo = {
+		.encr = {
+			.geniv = "seqiv",
+			.blockbits = 128,
+			.defkeybits = 160, /* 128-bit key + 32-bit nonce */
+		}
+	},
+
+	.pfkey_supported = 0,
+},
 {
 	.name = "cbc(twofish)",
 	.compat = "twofish",
-- 
2.43.0



