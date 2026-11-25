Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585122;
	b=wQf0UhoHxX7H+/YRtzgTN2cr1knMYReE9IKEa/SGvJZbm8HW75lnuJ9rQHTMRq2uRBHg
	 VVzrphlLV9owMs1PewwLa8DRMVBYS1MtpAONr7BKNKBuowfd17PZ3FQyXqX1Rpr3dq3PQ
	 i+Otu4Oehv/iBsy35zPrbooevnfl2Y+aRAjxdUFge5Z2MUXGoHxC+0S+0G8G5nTLvdwCs
	 Nf+JPb6RTkBvzqja/tgHKFh/b0HxAHqTAw765tO+9Fcfq7We/+02snjV9yqwGlqXvOS0h
	 LskAVQJ/D/U7MH0aXohs17O8vYkBnFGHSqvCQSkXWnIdGjUT8ncbiq/RhQs9nC2koKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fcNis2XnhX8zZlzTY3CceXUccN8sacTSpQICWbCSpaU=;
	b=0FgMEMGBF8aPfZeA9/cxacRKx4ZT1tfRdLZikJVKH1IqSLix+hrp6NxT8oPc90hrGpTU
	 02Vis2aLJApVByWy9VJD8pNpRuWzWB+WEAh4En1CUYSfJVZsp/abBmg3UlvKdyXx3smsv
	 baULTIUCU9bVWAPvU9nMlgDw6lYI20IErdRhx/DRrlOr0Fgbir0z4i++TzNeAs35EdbZJ
	 Z62lEOChO2gSiO863DsG6QE7dPqmw5yj/HWC6K+4K0aRIz2Ex0vR9FpuCwllcroG/L+7U
	 xqhu6LN+pX8aViveVssADhOTRKgI9ytX5WgyaFxGDgKeqCsmHnw+q6MZgYosPPcWXiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=mfbtyNd8;
	arc=none smtp.remote-ip=209.85.217.99
Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36B1606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C36B1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=mfbtyNd8
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-7d2db1b9bf2so1825005137.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795585119; x=1796189919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcNis2XnhX8zZlzTY3CceXUccN8sacTSpQICWbCSpaU=;
        b=mfbtyNd82mrUR9u9R4zqv5bGvQvCw92QzcT2UF7nIcislwzllBPCCqPFwvCWw6ny4Z
         WlaoXUz5cxA7ei/w2z4xUgXj4oIxypTgHewdaV2MQ35SNwsvIGQz8NFxNZSSGVBZKlOb
         LHUJh8CwuGHEfTm7eZPsf7SNy4aIGZ6nOW4PbvBJNX+EKqQpA29m0uPKGIFu54nMknwI
         v646MzxWCrrqRJf78CllShfspxZA8LlrmPtZVhNLiVPNTk2qnZ/Ztl6g5ha5PZqGBxRH
         psvZvz+Uf30WhTRZIzxrERMGeo3JXoYqdas17IY1gVwJaPlmQS2cH5BlqnhohyhU/Xco
         jbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585119; x=1796189919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcNis2XnhX8zZlzTY3CceXUccN8sacTSpQICWbCSpaU=;
        b=fe2gjjiinQh2zDaPsfkJUyQxbUVtu6/niMnsk6PXo/gfwdlC+z+txonjiiKcDC/BI1
         nDGfFDrB7HYH2UaAkpy36brd/FZNjjF2Edemi+vbB2IAod0p7jpPcMXMlbTlIZsScboT
         ReGY7KyMzr0HGvus4JvhvMd2lz7G/fGksEwn13dKM9KYm95+8fp28znHqAhQk1NML3NZ
         YHOPktLvjB438fjb7dgUgn87s36LdeywUzgRoSlMOTCg8WLxVv1YRT/ydc8UQYjwh31s
         ATr1/oFYl2hGr0AxAH+dEfwwr+7kVy/Vb996PtKpLV8sPCi3Kct0oHJCHDYtXuT7GVze
         I3qw==
X-Forwarded-Encrypted: i=1; AL+hErHXxDNgYBcHFOlEMXcVyyG5py+nd2VhSJ0M2yEW8YuClnGByhRi8jq36vBjJSk1YTyfXbvi6G4=@vger.kernel.org
X-Gm-Message-State: APuU4Z96wg53k4HlmWKNhfy8h2sQfsuBbkPdzVCTi3ub+k7C8tJEy5Zl
	9AhRphcz6kouHjQeSj2TpxY1+ymAjbVAu6EbvXV0wIoacThbbKcSiPjj9f3SFF94Fuw7jUu+edN
	i42C6gfyOg/TVNvJufEVO9QMyQuT4LVX+xjfze6tKrDmTJbms5C7a
X-Gm-Gg: AZFdTZezwKNBlYVkkL7hUCapuZbOoV9m/Qt/7gnumxkcPynjOsBL81vDGWL3jqwL0VT
	hCu48JGQgcpMkcCyuYaKBsVLTYYrAywNf8COu2XtiFaBEhu7UOcgIUuU9V0EyitEi/KRAYihDWd
	0jgM0LTyzwffYoXn5dHKCMEKyn+cUXZQAflfrxggJ/8F9puXOkcOw1QCNUJxhTo6RDAJ3sP0itr
	9a2oBvpwQFmsQrZWkx2gprJfS9JQYGT24Ut59VFG8u0mUL4gfdMpCZJPKMgrxwPNOmdAbMTza/Y
	cCkLB74AbmHTAZGjaOb6zfoAZ2VXAXTQXgUiaH4ebnWcnDpEaBKFurL6XVvzUUdRYMWMLJjjcYR
	N0bLWFeHRBKaszGd+DXFuPYtAWII=
X-Received: by 2002:a05:6102:4485:b0:7a6:cd7e:72db with SMTP id ada2fe7eead31-7d73962b3c7mr8485110137.26.1795585119506;
        Tue, 24 Nov 2026 21:38:39 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e0fe353sm1684066241.6.2026.11.24.21.38.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 21:38:39 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: [PATCH ipsec] xfrm: policy: avoid an undefined shift when testing the auth algorithm
Date: Tue, 24 Nov 2026 21:38:35 -0800
Message-ID: <928a3d63-eb17-4192-8952-a9a74a89c5f9@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
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

xfrm_state_ok() tests the template's 32-bit aalgos mask with
1 << x->props.aalgo, but digest_null's ID, SADB_X_AALG_NULL, is 251.
A digest_null SA checked against a template that does not allow all
algorithms then triggers a UBSAN shift-out-of-bounds report, which
gets in the way of running with CONFIG_UBSAN_SHIFT.

Fix this by treating an ID that does not fit in the mask as not set,
as aalg_tmpl_set() in af_key.c does.

Made with an AI coding assistant, reviewed by the submitter.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
Found with syzkaller (our own run, not syzbot).
Validated: reproduced on ipsec master with CONFIG_UBSAN_SHIFT, without
kernel changes or fault injection:

  UBSAN: shift-out-of-bounds in net/xfrm/xfrm_policy.c:3399:39
  shift exponent 251 is too large for 32-bit type 'int'

Tested: with the patch the reproducer runs without a report and the
packet is still refused (XfrmInTmplMismatch); with a template that
allows all algorithms it is still delivered.

No functional change is intended beyond the UBSAN report, and this is
not a security fix.

History, from the pre-git tree [1]:
- 6c55c29fabc2 ("[IPSEC]: Add transform engine and AH
  implementation.", 2002) wrote the test, against a single algos mask;
  4a618fbe0113 ("[NET]: IPSEC updates.", 2002) split it into aalgos.
- 3bab27b68626 ("[IPSEC]: Clean up key manager algorithm handling.",
  2003) added digest_null and SADB_X_AALG_NULL = 251, a KAME value
  (Jun-ichiro itojun Hagino, tech-net, 2000-07-16 [2]).
- af_key.c guarded its copy of the test in f398035f2dec ("[IPSEC]:
  Avoid undefined shift operation when testing algorithm ID", 2007).

Until now the result for ID 251 depended on the CPU: x86 and arm64
mask the shift count and test bit 27; 32-bit ARM, PowerPC and s390
give 0, which this patch makes the rule everywhere. ealgos is not
tested here, so SERPENT (252) and TWOFISH (253) don't hit this.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git
[2] https://mail-index.netbsd.org/tech-net/2000/07/16/0000.html

 net/xfrm/xfrm_policy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index d2e938d4db9aa..b980d915a24a6 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -3396,7 +3396,9 @@ xfrm_state_ok(const struct xfrm_tmpl *tmpl, const struct xfrm_state *x,
 		(x->id.spi == tmpl->id.spi || !tmpl->id.spi) &&
 		(x->props.reqid == tmpl->reqid || !tmpl->reqid) &&
 		x->props.mode == tmpl->mode &&
-		(tmpl->allalgs || (tmpl->aalgos & (1<<x->props.aalgo)) ||
+		(tmpl->allalgs ||
+		 (x->props.aalgo < BITS_PER_TYPE(tmpl->aalgos) &&
+		  (tmpl->aalgos & (1U << x->props.aalgo))) ||
 		 !(xfrm_id_proto_match(tmpl->id.proto, IPSEC_PROTO_ANY))) &&
 		!(x->props.mode != XFRM_MODE_TRANSPORT &&
 		  xfrm_state_addr_cmp(tmpl, x, family)) &&

base-commit: b88c75488ecc768acadb14e980bbfa087b1dbf38
-- 
2.53.0

