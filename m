Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590879;
	b=dI0EhvSAlkLN9dYHJlpPo6hKbOsLQNZVtiv8qvEYXY+ucs+WyhWeMm3FSMKpVWL5KK4k
	 M9JgN9i+WjfXoIIxBlDwun09BoJZi2g102DkuFYVN6dgUoYfm/A0RrpF9DXj4R1jqg+gv
	 38V6lhkPeCLZm9Yb58YIMtIvHr8bKINkPXF3oy2JjRywuH/quze4XRzyOaBYgB0oIyjG0
	 VkdpP5EFqVWtGNuJch9OAqVnX4RkOxQlzs0VqnXbFXSuAm/poWkNjG2OuMio0z7S7NW8C
	 tywOJ99v19d+YWVNvhRGkEhqwGDD3EAsYkMaR62mCqUEsmm/lgWzXCR21tE2Gr0dKGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F34r5sgctXkw05FFIvh/GnUaa/LrTafB69MUuGffPe0=;
	b=hBc7qgzGPBnciMaLlGnb/XXwHwvNbKmdjMe1RRBO4LMHMX94wRVgkqTpEzFyz9vbtyo8
	 zVYPwnGrB9Pzx7SVJxheQ6rKgIMjCtS0Jt6cb8obocoEqFX9AFS+U51qUgKtld7R3lX4d
	 fbV94qIwiI4LyqHuecf+0ELff3VO1DIL8UVBRQY8nTlJ1fax8k5xqPEJnLyJZOuYrnaA2
	 jPoyHbZeUD49jyG6ssrnqPGI586vC7Lt2pEdTLIKNzWo85csMkMAx5xBs90rbn7hXy5na
	 HOnaHh/1RHTwWYksp60a8UnPNnYA3BQzFlha+Y715MNiiARw+cIRtLqoqVNNwLX01iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QoT0S/X7";
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C97606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05C97606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QoT0S/X7
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f03920c477so46032545ad.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590878; x=1796195678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F34r5sgctXkw05FFIvh/GnUaa/LrTafB69MUuGffPe0=;
        b=QoT0S/X7Dl4jKZBlqJs3olEttVcPVBXhY96N/XlFNwwCKdUXdiD/WtGzbcGXllkCnU
         gGOvwNMBNnsMEHykEZdsezAKWOLiacm39B7JsOVtiXyI2/1U1VS2qJmfYUTDtnF2HQYz
         NIL4NSU8OY9y3NdbOoP9whNptTApyO6cD93IbmjQnwBNZviS0qaVK5VsYG+kRGm7eiBF
         9aAzr7wr7N96Eri8oUGr3Nc0yc1cy7jDaspcvDMEr4S19MYEgj/8y2ySRos50WSPB5IA
         AXKCh0jIJxxr4LZUHml2id5XtBkw8BA/r2lwpCgP1JyBo19m4lCCHVQimDPUmlsUBTKY
         nfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590878; x=1796195678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F34r5sgctXkw05FFIvh/GnUaa/LrTafB69MUuGffPe0=;
        b=27PBVxcyFrPajDTR9DRbPUThJTxbDcH2ICkvNVjeO5O60jeqAJi7x3sW3z4Rjx0Ugp
         Z0KWbzOmB1AUpKJffgTW1kbz5JxdzUFYOyAz3oUkxFDCTpa+u4EQZMGFaE5x0dgZU0sz
         0p4QCv788BjZ3FdQHW2FBbO6g4FMHiyzei9WDsaOFl4/8Y6Vh8w5RO9swUJK63SGrE8G
         85ggKtQIn9a60Ei7HYW3/AwXOChhYXIw6X4NS8UzDoelY+31/gHmCB/HPiiuoDsukTwR
         s4lSS5nCV4iTYsIyg4tae1dpjqBYWkLES3TbA1JUZwj7rMYel/Fi0l46P7dGZCAjuJsS
         z5KA==
X-Forwarded-Encrypted: i=1; AL+hErER5IHDZ8KAk/FBZDKVhO35KFISY/Af09E1/W75h4yjc+E94TV5j10qC8rQwkvhAkBvTBDAGoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vaMTCS4mVwaQxCIrSe8fbVRNs0Mfv6+5F9VOlojOb50UHCbOn
	Bk/0LvWh1WbPdFGs5/FHF7h/sOPfkxq0WCdEdpW7NSOMGgkJH4a2dTEc
X-Gm-Gg: AZFdTZdBTryTFjiFBZC6gW+gp9yhleLf9cXWmbY4Hft30Obyy+lFo1zxJ/aPuDNjxE6
	8eyHAYF3NuuYqzOOjitg3uIbAeGuaN8crV1s+YoX5Z/5Mp1Nqfs0gsELt4tUDPtE2u17dxv88Dx
	ihBYSCtiL9SdsK10NZBTLFrOsfbCwAMFLximXubj6PfSocVFR5I6jHbO+xrRNQXSlr64s9jG8aq
	2acZQN+8elYUU8cK7/4aH1Q4i1vcV2GOsbpZ9MZu5IZC/Lz00Ws0PCB2clPXP6b3bn7ntAaO3Cp
	tmil7drIlYc+HWlvXb4zhpWlx+3M5WKrQMgdP0behxl+QQkz264bOQH+F6IKW52KA1vYoT4sM/e
	fGujHh2SW+8noQrAzLwgfuZv2hzULwKHN3qgmLiglQtPkD9/RaAkQ+DWs+CW38z5Knaxk8CuGEh
	aNoYAQEDD0I/bJ0kp1nVS5rQioz+fm0EXDYl/M9hQNGdbdC2SH0UvMW+12pUVyNTEC/ylAAL9NV
	vHsvhd5ezQUHJ3LC2Xh6Wqxvc5wfe666wf2NrKebN0pWVBe6JLRs0mD8VtJh91O2NhZ5+esB+ut
	ZJOodrFeodHxHrnkhBs2Itqk171K802xeojpBDabSJVi0fuH47BOKC8IleQH3MDsBbxIil6ZtEt
	TvhBy2ufdoQPA
X-Received: by 2002:a17:903:4b0c:b0:2ed:352d:c619 with SMTP id d9443c01a7336-2f03f16ca83mr161558865ad.46.1795590877834;
        Tue, 24 Nov 2026 23:14:37 -0800 (PST)
Received: from JUNVYYANG-MC1.tencent.com ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm53562485ad.11.2026.11.24.23.14.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 23:14:37 -0800 (PST)
From: Jun Yang <juny24602@gmail.com>
To: jhs@mojatatu.com,
	jiri@resnulli.us
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	hadi@cyberus.ca,
	baronchon@n7mm.org,
	netdev@vger.kernel.org,
	junvyyang@tencent.com,
	corvus@tencent.com,
	stable@kernel.org
Subject: [PATCH net] net/sched: act_csum: reject over-long packets before adding the offset
Date: Wed, 25 Nov 2026 15:14:29 +0800
Message-ID: <20261125071432.53293-1-juny24602@gmail.com>
X-Mailer: git-send-email 2.54.0
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

From: Jun Yang <junvyyang@tencent.com>

tcf_csum_skb_nextlayer() validates the claimed packet length @ipl by
calling pskb_may_pull(skb, ipl + ntkoff), where @ntkoff is the offset of
the network header from skb->data and @ipl is taken from the packet
itself.

For IPv6 the action honours the jumbo payload option, so @ipl is derived
from an attacker controlled 32-bit value and can be made to wrap when
@ntkoff is added:

  ipl = 0xFFFFFFF2, ntkoff = 14  ->  ipl + ntkoff = 0

pskb_may_pull(skb, 0) then succeeds and the ipl < hl check is also
defeated, so tcf_csum_ipv6_udp() hands the packet's own (u16) UDPLITE
length to csum_partial(), which reads up to 65535 bytes from an skb that
is only a few dozen bytes long.  The ICMPv6, TCP and SCTP branches pass
ipl - ihl, which is negative as an int, so they do not read.

Reject any @ipl that does not fit in the skb before adding @ntkoff.

BUG: KASAN: slab-use-after-free in do_csum (lib/checksum.c:64)
Read of size 4 at addr ffff88803506ed88 by task act_csum/9648

Call Trace:
 do_csum (lib/checksum.c:64)
 csum_partial (lib/checksum.c:119)
 tcf_csum_ipv6_udp (net/sched/act_csum.c:346)
 tcf_csum_act (net/sched/act_csum.c:601)
 tcf_action_exec (net/sched/act_api.c:1149)
 mall_classify (net/sched/cls_matchall.c:42)
 tcf_classify (net/sched/cls_api.c:1875)
 tc_run (net/core/dev.c:4635)
 __dev_queue_xmit (net/core/dev.c:5034)

Fixes: eb4d40654505 ("net/sched: add ACT_CSUM action to update packets checksums")
Cc: stable@kernel.org
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Signed-off-by: Jun Yang <junvyyang@tencent.com>
---
A KASAN reproducer for this issue is available if requested.

 net/sched/act_csum.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/sched/act_csum.c b/net/sched/act_csum.c
index 5fff52a8ca90..64002a4bebac 100644
--- a/net/sched/act_csum.c
+++ b/net/sched/act_csum.c
@@ -135,8 +135,14 @@ static void *tcf_csum_skb_nextlayer(struct sk_buff *skb,
 				    unsigned int ihl, unsigned int ipl,
 				    unsigned int jhl)
 {
-	int ntkoff = skb_network_offset(skb);
-	int hl = ihl + jhl;
+	unsigned int ntkoff = skb_network_offset(skb);
+	unsigned int hl = ihl + jhl;
+
+	/* @ipl comes from the packet and may exceed the skb; reject it before
+	 * adding @ntkoff, which would otherwise wrap.
+	 */
+	if (ntkoff > skb->len || ipl > skb->len - ntkoff)
+		return NULL;
 
 	if (!pskb_may_pull(skb, ipl + ntkoff) || (ipl < hl) ||
 	    skb_try_make_writable(skb, hl + ntkoff))

base-commit: c5de2ce2fccdb7d3b48946179634eaa3d7ce2e7e
-- 
2.56.1

