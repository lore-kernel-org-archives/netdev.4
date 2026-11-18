Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015063;
	b=rSmGqoT3wSTZcR2ZKIymFrGq4EG0t7QPzKbV1PDPAvCKnTsY7+NQ0PkRYOtnnlh/+6C9
	 k+XXUsxBUIU/gPPy8DZUS1ys+sQ8ibNlqShUC8zlBkbAnkDl0GJ6/T11fP3IRTImbZBB7
	 uOWdpqYkQU3E8uNS/mOEpLc5xqdgwPifM5KeF34YIBGfxn9L6hzaBrOh0UrzEObJJ+yiE
	 NX7r81amz0PjfnfPr7fb1NnKQeqsYGE3vfdMYrfsW4vgAeuaHszzbYS2cuDUu1mNWnNA6
	 DhUM83+pBvCfihk3YmZ2hQfCDhQ3z/5YuEgvNsGlRmB/5sZzKMsh8P7ELUJYPaQ6cpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CvfmLkDBN8I5nxmJLaVmq3PqMym7xUmGtMx0tuqzeb8=;
	b=wetyZ6bpSf5Unv59eR/frZ3JTpOaASKxrHtt3/5rFIEOsSpIPw+jqE/1f9ofq6t6aGnh
	 O3IVC6kOPVBYNIKFsbnKWjee8zpttD+fwPwgbOx92cQ3/uUAVQ6N3RDKpOvF9KPBqz3LC
	 2ib58nY/lEBbm3KOWYLgAuBF0edR9Yb1z6veyWChsnKl7TzzKjFq2iHOaF7Mbo5m2co6/
	 UJFJxi2ughzbVvtQ/nAfyL3RsFIfZF1Pfl6eQGF/yi3e7ZmaagjIVAGQ1oag9RUK7IT0L
	 V01U/Fwg5KXng89gTC1082aAy4CdX+tGNAdO0HxQkrlRtkgDKf0fkQJgIZ1pUvfl06g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkxoNCmH;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABDD606A333
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ABDD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkxoNCmH
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50cc8e0f84so158056566b.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015062; x=1795619862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvfmLkDBN8I5nxmJLaVmq3PqMym7xUmGtMx0tuqzeb8=;
        b=WkxoNCmHgt1cV07ODAtkzGUMS3QEMg/pCYKSsi7za96v7vCk70HO1zqPcE+MRzXRE8
         3Ug+iZhmPZawGyCXpg5TaA9LDGM+5cwSQlDPvnZAS96WzWkFIuLV7BO2ijuec4pvTQaO
         jhvx1sf59NiMJ23lRpkoDMvQaNjUNNKWTMm39AMZmGrJcYc4rRpQTohXAFM9uMAlIPVa
         yEEIp/WRsoOJgDL1T2bqbtafeyS/7mB8YOYKV3gx2K3sKVE7JFUEo8AEMHtpIBEcy6lu
         pNNCyqBz+rDVZmvcdXLNAK42YxSJcqZkrDf+iIldG59pYVnhkSNZobaVYgcPOQZjVa4t
         qIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015062; x=1795619862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvfmLkDBN8I5nxmJLaVmq3PqMym7xUmGtMx0tuqzeb8=;
        b=Ojc3LCaeMlEIzMqfwXwlXKI1OCcjcx9UbtgiV+PdFW5+cjjs9+3BLdnQRYcTCHQ31c
         TGsY1Rz4Agfat2wtKPzAf697J5IXMAAJdR2WXE/Y1DACxpz3PUHGIAUMKAexwBaf1VG0
         C2X6RRmHZgITNuHm15bKRWCi5iwM7PUG4FbNMS+4j9E5ss5Q+3WhnqRGS6ntocaaMmoh
         bQu3Fm2pSlG10e6XvhE88RHEMFgnV3jDB5HY3reaNY+XQHnh17PuQRFN0BpfZFxd4/wI
         NOeohjO/qvEoZSPEj1VqSwMlflJESXDSdGCCK4W2Y8r2x3kaH2NG2QJXgjl5iGnkIyte
         GNRg==
X-Forwarded-Encrypted: i=1; AL+hErGyujq/ToDLnMeX5bAofoTzrtG16kmWY43h7UCx39uyAiIGlDWQiUsWxODO4gz1vDhtUdHn2Uw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LvG/J0MuxzXvIBjxXTUerIhs95O+ZyNNWF9nV4D/Gztz+eaEb
	fWqHbLRSxQMT5Q4VQz47vCdSiRzANMjlHgByfPM1h4k+2yH2ZP3+18ch
X-Gm-Gg: AYBFou3gdlpGjNv/18Re+8494lABAswtRzNQXfVlrQ9DfIvZ384kFoTxziqHoRjIZej
	7JHVKoxHvDPc5sO/4DYEdi/V1/vttPI9bHrqCSC65L/c4G1rmK2quwvnLgPdd/qty39B4s3dRXf
	MWrdJNxHT377Gp3k8GaYKBiwMEfLUxKV2/Ya6uOU1Xbv8qQajWUjoeCBRHczxSAkUQ48NQN2hF6
	nn1IwKt8HlDx7oYDZusmvIF9uNiYBz3bmJzp8fLR3aCr/gtR7V3CAPDyW2kkQUWW07o06dmQvtx
	oqtBtDQ1L4uQOK0TCrM4NvsZ3LXPZJ53ez13GUpUV31KkrK4EFCC+GZxFjbTzSrhtKMDo8Ib14m
	Cnk/J+rtPdtb/9sXjBk6P7dLBZu8o36PmW2ACVt/1gz6J1AhbiStcV4VkR2UgIwJ/iGYja3JTrO
	xUFrpXhv2VtGGtajIfEMku10vx6xdmlWQfJ21xDu+kS6xAKGUf8XtZlyzjBMxWR6hmy7xYI0YtW
	l4lNr2kige2Oeh3JEUcq47x8rVe9hqWwMqrJi8eNZzaHZAOIcjJ43doMgCojpU/4+xSuOrruP3p
	AzuCIRwa/E/C36IWzkAVgY+oM5QyM6BPV4W0mbDQ
X-Received: by 2002:a17:907:7f91:b0:c29:f5d5:5a9c with SMTP id a640c23a62f3a-c510e32a1a6mr291758866b.38.1795015061528;
        Wed, 18 Nov 2026 07:17:41 -0800 (PST)
Received: from theodors-laptop.. ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b888ef94b0sm1226142a12.5.2026.11.18.07.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:17:41 -0800 (PST)
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
Subject: [PATCH nf v5] ipvs: ftp: do not link expectations to unconfirmed conntracks
Date: Wed, 18 Nov 2026 18:17:26 +0300
Message-Id: <20261118151726.2509853-1-theodorlarionov@gmail.com>
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
the seqadj extension.

Fixes: b25adce16064 ("ipvs: correct usage/allocation of seqadj ext in ipvs")
Suggested-by: Julian Anastasov <ja@ssi.bg>
Suggested-by: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: stable@vger.kernel.org
Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
---
v5: drop the second nf_ct_get().
v4: check the conntrack at the start of ip_vs_ftp_out(). A server reply
that fails the check is now dropped even when it is not a PASV/EPSV
response. Without a conntrack, e.g. with a notrack rule, only PASV/EPSV
replies were dropped before.
Link to v4: https://lore.kernel.org/netfilter-devel/20261117123944.270667-1-theodorlarionov@gmail.com/

 net/netfilter/ipvs/ip_vs_ftp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/ipvs/ip_vs_ftp.c b/net/netfilter/ipvs/ip_vs_ftp.c
index 44de99f4d187..cf640cba0b12 100644
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
@@ -382,7 +389,6 @@ static int ip_vs_ftp_out(struct ip_vs_app *app, struct ip_vs_conn *cp,
 	}
 	buf_len = strlen(buf);
 
-	ct = nf_ct_get(skb, &ctinfo);
 	if (ct && !nf_ct_is_template(ct)) {
 		bool mangled;
 
-- 
2.34.1

