Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510367;
	b=ox4mkWayzx3LNSZqp4sD2PkYnEdyrnaTQEK7xsEZyRXvnfpO4bnUsjyf7ZJ+1s89yOQ2
	 lsqpPS9WaF/vTZ4gs5wqiFR1BarVlTD0Kn/bPxlGnsckKqjsLo+wBRR1hG+j3wDheTfi/
	 smUF2cFMl2BWsAQmRHZSgQ3X/vyP2AgcWBuo46FHVJ1HRENoBY+9d4xi+c1nOAh4vEIFy
	 mI2LMXUDL0jc/gYuCfW70em3uJ6jT1LsRkZvO3fzGArJVlXoSfY1yuYM24+jv5iCPYmAY
	 XOdfMd0gh9/QAGSevhs+sdh3R7TDk4soLSDEdcSJ8tr1ajzn5c++tsHPZ2th4S4OPDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TR53zPkVba88VfL7TptIVzoMfVRdSeP+zd0R3S3Wgso=;
	b=EEjm0PCRZ6nEI75rz8tdFqeWDWbVIdlZwiL4nGtwQyKHVJqc9JNDGTAQXJwiEGJeiXGV
	 uArAVDF0gIMJI+A958bZFMx+Jy3KrZmxjBxE4JNfU/7HEIp9PE69JisyOdYoE/oG2QuV/
	 45UsOqG4QqWJI3VBBtvd7jssJjPV7p0RMGIWH9pxwkOLgUNfViVCFpIeDAlk+KPVqa1Wa
	 zjIz52LR/vOl3nAkeElTRW0sK4czsDxSzwLlN7ayNz6cITcDmekL9RzfvZgHBJusTlHUd
	 nmUy3gzUG2fH44+s7qxmzhadcImcEYrbd+JH1IL2rR5Dmv2ZkdATeYR3LBG1WI3PjvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uX79fbci;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC87606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC87606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uX79fbci
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ae5ab4fcdcso28079361fa.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795510365; x=1796115165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TR53zPkVba88VfL7TptIVzoMfVRdSeP+zd0R3S3Wgso=;
        b=uX79fbcioXcn+HG0sN8Id1Ql5mLaTWW7HjbIPCjEaGDwu39hMqQK2b04NGjw1LxZBL
         er8gkOQTqKf41KfD76JzTiyjxtw+v/1vnxHVjxj5xaeSd/PYlkcFExlDpNoUPhugYqHD
         Hu8gtZOXNTT47VIgSCEoSdlAVqFiHIc1r7nV7sjOW21WqLhJoffxqDF63kXI4UFmUXn4
         CZImKjDDhH7Nlotyu4w66d8E5RLauqnpIfpV7dtLEswiEnwg0Dv9z+9hlyMQtdT8w2JE
         2mu7mwUPFAokUfhYhNCnjD+aaV+3cx9v9C6TJJx2jeG5/V4E7wLoCiGQskV3XVU8ws5i
         QQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510365; x=1796115165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TR53zPkVba88VfL7TptIVzoMfVRdSeP+zd0R3S3Wgso=;
        b=o+vuEYEhjASlxhfLOTItHwHEwgH5FWmeuOGHnuVGHli0w9sKHS3odiv9ghLHZgas+j
         P2JNqZwSG1PG4uLk01j6HEiERanZE9vTXiK4Fb5yzd5ewHc2lnPO6GOLI48jxY9lDvln
         +zyj9GfYJ0xZTrVWBpJY/H+cOEDULd0gZg+LRMewC2+WNFaFXXXSjZeEEVW4djeuW6SZ
         2F7YUKfRya+AwhXxqe4K2c4QquqXyvXmoE2dB3hvmOaXiQS0I6oCCtdOuXleax84YmJC
         WcVIB8XfWx8uJipR96sPFEU0DVD26jxdm+DhQxQXEYJYqGz64l3etEyW+UVE2Tn+4GLh
         lfjg==
X-Forwarded-Encrypted: i=1; AL+hErE31gPThVrvQkfHF0U+/gJT0P2Tn/RPiOklFRP9odO7D5Zd9Uj5tojMbyjqOB+Ncgi0aa1PiTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wg3Cpp0m4dbgVx3ssWEwL7oa/8u8DjNo+dw5hU+Vjz2A0w9P6
	nUuEopbHkJKepz8g/8qRqO4uLgPYkz7k9HEVs2Rc0GU0QzZ3pvxlXCLm
X-Gm-Gg: AZFdTZdhtpzz5ZQi34Jw2243wYY+XFn0aqLEsHTNoOJuU4ZYZaGkrpWUcn9JRWJjspi
	y84S5fL25cYaV3L0mZBNxul2Q1o5jn9kAGJWhPeYWWnNAbcw9Sqh9z/a1y7MthVElrpd6OJaIWL
	tb0X7tTeI/gZSGNL/lodOQQfKicLij3IVVkHwyV+NibpfyzZBkO3Vd++MvKe4vFCuy7AcP9imwR
	cY51w2pMIjBAtfYVHEoGupOZcdjR+QJCEgrrOalbtAYIMGQM+V1oU80trnVZJLpSsRKX4/4s0uN
	JE/LdT8mB6c1+fTe0KePGS0oe9DvwNOvxEoHeAXJrlylMF1Dd9KSlxonCeV4TK0AZ32wnGZSPwz
	mhINE/+DT+W5Lat+BxRQzZcT/MMI6uNsgDbYtbI/COSFffdRgmQNIInMk7Xsy3FHoHhqeH/rrW4
	F/XryeJeTn57DGOLoAJzl5trBome3+BOX3DO9pliSo+B1vxMYqIbCb3n/LwLGFL/yWckA50aTU/
	NorNbhs3z0Ax8RAGFAIbGmL6MMgRi5eqeGEH3iqbiW7tJMJhiMTkNQbFWGhXZwWX6v171PJOFmI
	K7QRavPkSIkqGRuSpDg14gG3UoAzk9rpYU6OuKSzmgi0ydyS3vWdZ2I=
X-Received: by 2002:a05:6512:3e04:b0:5c1:5169:7d96 with SMTP id 2adb3069b0e04-5c1bc7bcc2fmr4609413e87.18.1795510364703;
        Tue, 24 Nov 2026 00:52:44 -0800 (PST)
Received: from theodors-laptop.dotcomltd.ru ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33576sm3575596e87.6.2026.11.24.00.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:52:44 -0800 (PST)
From: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Julian Anastasov <ja@ssi.bg>,
	Simon Horman <horms@verge.net.au>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	lvs-devel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Subject: [PATCH nf v6] ipvs: ftp: do not link expectations to unconfirmed conntracks
Date: Tue, 24 Nov 2026 11:52:39 +0300
Message-Id: <20261124085239.62750-1-theodorlarionov@gmail.com>
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

ip_vs_ftp_out() can link an expectation to an unconfirmed conntrack. A
later extension add on the same packet, such as seqadj in
ip_vs_update_conntrack() or NAT, then reallocates ct->ext and leaves the
expectation pointing into the freed area:

  BUG: KASAN: slab-use-after-free in nf_ct_unlink_expect_report+0x490/0x4c0
  Write of size 8 at addr ffff888004dd4e48 by task syz.2.17/649

Check the conntrack at the start of ip_vs_ftp_out() and drop the packet
unless the conntrack is confirmed, is not a template and already carries
the seqadj extension. This makes the conntrack check before the mangling
redundant, so remove it.

Fixes: b25adce16064 ("ipvs: correct usage/allocation of seqadj ext in ipvs")
Suggested-by: Julian Anastasov <ja@ssi.bg>
Suggested-by: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: stable@vger.kernel.org
Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
---
v6: remove the conntrack check before the mangling and the 'mangled'
variable, and unindent that block.
v5: drop the second nf_ct_get().
v4: check the conntrack at the start of ip_vs_ftp_out(). A server reply
that fails the check is now dropped even when it is not a PASV/EPSV
response. Without a conntrack, e.g. with a notrack rule, only PASV/EPSV
replies were dropped before.
Link to v5: https://lore.kernel.org/netfilter-devel/20261118151726.2509853-1-theodorlarionov@gmail.com/
Link to v4: https://lore.kernel.org/netfilter-devel/20261117123944.270667-1-theodorlarionov@gmail.com/

 net/netfilter/ipvs/ip_vs_ftp.c | 45 +++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/net/netfilter/ipvs/ip_vs_ftp.c b/net/netfilter/ipvs/ip_vs_ftp.c
index 44de99f4d187..c90f7a9e1452 100644
--- a/net/netfilter/ipvs/ip_vs_ftp.c
+++ b/net/netfilter/ipvs/ip_vs_ftp.c
@@ -29,6 +29,7 @@
 #include <linux/netfilter.h>
 #include <net/netfilter/nf_conntrack.h>
 #include <net/netfilter/nf_conntrack_expect.h>
+#include <net/netfilter/nf_conntrack_seqadj.h>
 #include <net/netfilter/nf_nat.h>
 #include <net/netfilter/nf_nat_helper.h>
 #include <linux/gfp.h>
@@ -283,6 +284,12 @@ static int ip_vs_ftp_out(struct ip_vs_app *app, struct ip_vs_conn *cp,
 	if (cp->state != IP_VS_TCP_S_ESTABLISHED)
 		return 1;
 
+	ct = nf_ct_get(skb, &ctinfo);
+	if (!ct || !nf_ct_is_confirmed(ct) || nf_ct_is_template(ct))
+		return 0;
+	if (!nfct_seqadj(ct))
+		return 0;
+
 	/* Linear packets are much easier to deal with. */
 	if (skb_ensure_writable(skb, skb->len))
 		return 0;
@@ -382,29 +389,21 @@ static int ip_vs_ftp_out(struct ip_vs_app *app, struct ip_vs_conn *cp,
 	}
 	buf_len = strlen(buf);
 
-	ct = nf_ct_get(skb, &ctinfo);
-	if (ct && !nf_ct_is_template(ct)) {
-		bool mangled;
-
-		/* If mangling fails this function will return 0
-		 * which will cause the packet to be dropped.
-		 * Mangling can only fail under memory pressure,
-		 * hopefully it will succeed on the retransmitted
-		 * packet.
-		 */
-		mangled = nf_nat_mangle_tcp_packet(skb, ct, ctinfo,
-						   ipvsh->len,
-						   start - data,
-						   end - start,
-						   buf, buf_len);
-		if (mangled) {
-			ip_vs_nfct_expect_related(skb, ct, n_cp,
-						  ipvsh->protocol, 0, 0);
-			if (skb->ip_summed == CHECKSUM_COMPLETE)
-				skb->ip_summed = CHECKSUM_UNNECESSARY;
-			/* csum is updated */
-			ret = 1;
-		}
+	/* If mangling fails this function will return 0
+	 * which will cause the packet to be dropped.
+	 * Mangling can only fail under memory pressure,
+	 * hopefully it will succeed on the retransmitted
+	 * packet.
+	 */
+	if (nf_nat_mangle_tcp_packet(skb, ct, ctinfo, ipvsh->len,
+				     start - data, end - start,
+				     buf, buf_len)) {
+		ip_vs_nfct_expect_related(skb, ct, n_cp,
+					  ipvsh->protocol, 0, 0);
+		if (skb->ip_summed == CHECKSUM_COMPLETE)
+			skb->ip_summed = CHECKSUM_UNNECESSARY;
+		/* csum is updated */
+		ret = 1;
 	}
 
 	/* Not setting 'diff' is intentional, otherwise the sequence
-- 
2.34.1

