Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919198;
	b=geFvOcuhGjlb32ET/hB3pJDfHo0RFkRLFEOVr4i4qdZ7LmnzMbypxVE9P6zvKW2BFdhd
	 n3zmRQi0R+L6HrhAYM7xuMfXKN2GbtCVFzCvjLCEwA78UK1cole4nrETgXE9QK9FHjf9t
	 S+UcxOnn0uHkefr5cQQaq01T55QWu0ShE6wAwu9dB/YkCciPzW+7lFpB6ogcbbETt87yo
	 xZpU8gM5aizhFlrQSDDPu8HlGFteF5VMDLGLoWKhZomop9zSdSkut1o/Z10LYGwrJprn7
	 tqsot0KlFI3kcZ5tre0WRI1kokxlx2tctQR6UbOJHeox8lwp0OmRFGNsTBt8a2iSYtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KhOt0cRnKYV36pufkweOfchwWzEZ+liNrgU+2GDZ2tM=;
	b=kIj+BeT1iejOArtOp8kw/GOK/H5gf02dXTMOJrMRE3JrNfmW8dOmEWNij7H7oGO1nBdQ
	 GSB9w1arGv9tu+W7Or18E+g5VbZbjnzDiiT+UFO7/+RhxDUwE2j8K/tajV6cZ8LblgFNg
	 ciLAJ9mXzTA4FDoJ4qEhZOPkjSS7HGFdM0FmnA9D4jVRoBAKsC+W7Qxa4mcyWX4/U8ivj
	 z8k0a73HiwY5XrHFsiTi3XkQO8SROdtXK9Ap3mNJjdjX+p74V6USY7CCVPMAarxgCHXd5
	 I3yoVf6RhXOQY4Gv1tw28auXDDuv0+sQadiSGeyZnfCONUO4iPPlcYRV34LeJTRY49g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z+o3y/xe";
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0559A60A3834
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0559A60A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z+o3y/xe
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c45551fa84eso857073666b.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919196; x=1795523996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KhOt0cRnKYV36pufkweOfchwWzEZ+liNrgU+2GDZ2tM=;
        b=Z+o3y/xeqrCWgUnciSXgqXTvKZXDUNgxhFOeohIWAz2lHSZDsIpFgtW92+/ECzkP4/
         tdGYlRJR8Bep+VubJLpJvM8Rrpm/tfnKbg/1PotIYPmy1H3kHUiAGeFaC9AKeZhzIbLA
         0OS04vBCxQnKt1BDrIxiMLppZIGYI9wfB0xtmH1K/7JFDLo0LIEx0k2/Hn1O6AXl8VsA
         aUR1ZhsuZzNLCcLOAL/zuqqCE2lrLISii7Usv9C0gOOedV5nm8LyBooafuWNGMl0V8Ss
         0foEh2ocfyd3GV3dDQm9jw9t/Jv9vFD3+SjlX3GIdKcamGZqG9kfozc20DII3fvaXGPW
         rmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919196; x=1795523996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhOt0cRnKYV36pufkweOfchwWzEZ+liNrgU+2GDZ2tM=;
        b=yrTdbHn/Gja+87DqtfqrBUdTx1Yet8D1bzztun3yUOMffCRtYn4AMWJO5qBLynG23i
         xyDiHsyDa0mEuQLyzvzc+Uv8nj2FXISQ+U2zY+nOgslWd1/gEs/Z4KHvbg6bIq1/0RCa
         1690LrfQrukkn0zzB1cEW74sU0T6xXo2hizk7Ws8gJFgeDQVEOretm8xKezVGZahab9Q
         Ozkq+oXVqlcU9z3TFpq3kJSxNx4jI66RFMcG8c/Ha4AZYP+nLzIqCV43QDYmRWNwG+pu
         348FqBd0vwGeB2RtS6QsZ06dYB/nainbr70tRfsYV+QhAa+lNSSYjZEBR5HJIdSUbEfB
         StOQ==
X-Forwarded-Encrypted: i=1; AL+hErEkks3j9XnJQyeQ47NxTPAAuAdws6Iql4mqreWxsKXN5hYf+g4qxqptP6WLOtyeTHmS2bPuYQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wnltBezKgc6PjYV9DH2793O3qTKx5n4Goqw04n1nW0P7y1JIS
	rSp6J9lHVNVnOtNr/JjpF4a8v5BjU4RjHEOtMyXQPJuOkJviJ4xgurqu
X-Gm-Gg: AYBFou14BDsLt0ASXXMU899LaMvxPEDOu7TK8Vk3wgVrAvgCoXszYis0Z8yFsfEFFOg
	I+3/b6nIEPRzOSUHCctHwolPhL8cm2x2CsKOS0BShM2LMcBAol7H1iwVENK6AgqQCxWNnpMotcS
	KWoNewOSMHmCBbaFsIvsPdnUx9N0buo+QTD6ZVixvUyhqlftDI6OfyO7BAmi+nipPLaRZFDz+bb
	OpIPMVzNYhVVxJ9JvOnnE1eSfiho4sNyhvItzPco3VPuF54rEr39ASH465iuBlviPdclQSbywck
	1gT6nmjy3aMze6RJhzCrCxBZ/3awIroTkZ/n8LhT8ZzpA+2+lfLSknN3Ch+8FHos1diOvO6oAvi
	tvTRKkM+OVLY/1isFXSMf1za9ZNeJGOCJbGhNJ4Dran/QazUVGnebYzCmh3VgVFvuq0LB/kNwg9
	TLDNHFOFZ9mjC+gIYTEipwHHX8TGRr+WmiRhgROcOQdnfAMFCPT0c9FasOCL9S4LhkYZCxQwA57
	jjUCh3UvOMlwXgXxVqvyKICxPp3T9Fnuv9hgDvDVKPCPeT2XCnw/INCJorF7tVKVuzeR0+x3oZb
	PTTKbYJJOFwKEDygNkAY1FUJDOtq3ZFjOMB1mYmwwd871DK6EUeb0r0BgpTU
X-Received: by 2002:a17:907:8e08:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c5095db2440mr1272747066b.0.1794919196151;
        Tue, 17 Nov 2026 04:39:56 -0800 (PST)
Received: from theodors-laptop.. ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c520sm532332666b.9.2026.11.17.04.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:55 -0800 (PST)
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
Subject: [PATCH nf v4] ipvs: ftp: do not link expectations to unconfirmed conntracks
Date: Tue, 17 Nov 2026 15:39:44 +0300
Message-Id: <20261117123944.270667-1-theodorlarionov@gmail.com>
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
unless the conntrack is confirmed, is not a template and has the seqadj
extension that ip_vs_update_conntrack() adds on the first packet.

Fixes: b25adce16064 ("ipvs: correct usage/allocation of seqadj ext in ipvs")
Suggested-by: Julian Anastasov <ja@ssi.bg>
Suggested-by: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: stable@vger.kernel.org
Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
---
v4: check the conntrack at the start of ip_vs_ftp_out(), as suggested
by Julian. A server reply that fails the check is now dropped even when
it is not a PASV/EPSV response. Without a conntrack, e.g. with a notrack
rule, only PASV/EPSV replies were dropped before.
v3: https://lore.kernel.org/netfilter-devel/20261116101506.98853-1-theodorlarionov@gmail.com/

 net/netfilter/ipvs/ip_vs_ftp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/netfilter/ipvs/ip_vs_ftp.c b/net/netfilter/ipvs/ip_vs_ftp.c
index 44de99f4d187..216be082162f 100644
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
-- 
2.34.1

