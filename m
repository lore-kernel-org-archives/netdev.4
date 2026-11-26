Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688402;
	b=IV06Ct6UcZ1NE2AmWGWBD/0bB/p8mSq+B/OVGMkv02zH0yfhUg5fdbm14U378LNLl5bP
	 7p3oEgVPvTTyJQ4L/1i5OdsZVDDdxNK60DGiR+Dyq5Z8eIcFd41Ki+EBeiJVZ0QyK+L8l
	 M17UQbQus38kKSJQJ748HZQ7wOt0fBzCnQf89r+MHeNHjY6dWyFMdGWsgw5DLNEU14q/Y
	 lY32slBGQrgnA47ylX0bp7Vl+KnCLKMJdf7UH3zpVK4cMMc7lJz7K0lbd1wjI69zEVUeU
	 fniMxRv1SDr3T2D8wbGg0BiXp0g0YqEgSU3VGzO5p6LDKhZkSDAgkCs0k25+Gb3MNhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=j6Q6Z09Hui/dS1JTsCKZUo7wukUm5qF65Apk5oQFIkE=;
	b=zjq4uOKeMV5WDm38HKnbnDvFMfXxKNSGRZeLONljEYApvmYu07NRvO6QXCKlce/Gj13D
	 FMifPS1WepxRSilLa4LjaTZOSCeR7+HhLDlRdqg2ueNKsDEufH4eyVdYQvjZrz5D40liQ
	 VnqAJLYy9VYvk0Cq0jNcjif6RY6VmWXSNmMSgmSnXcaYFpPGWie1CwQ2P34YRnp2KQQTW
	 vDA8ZYAf3zbthNt3zrzacDdduPw1q0A+sVKZjicWLfQTQYIiSTLWjALSPu2oj+XnbRema
	 YNF1EFQjOxWyTk7tzIRj/owbTxsIKsE0LZU5SBrOHosNZXR72okA/jOYVyQSU3zf0TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G9leAd7i;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491EB606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 491EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G9leAd7i
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385c497bf94so5160389eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795688401; x=1796293201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Q6Z09Hui/dS1JTsCKZUo7wukUm5qF65Apk5oQFIkE=;
        b=G9leAd7itAHyQfMbjJ60qh0Bo65P1g4Q0RBZMZ39eWqm+IpTJcymcID3FIgY9Vq/a8
         voDMuC2oiduBF3LBp+d6C3NFEG3+nXsXfPNoW4KRm6F/Z2nqQo6d2IL+EFQerFAdoOD9
         bXNA0ysbVXJEPXUycs58vANSOIGwMmk+YV678WgPdluIkyijtaejPXjWHaFk6IPRxUTF
         8aK8vhoVonyeSJdhgZW9eE4krRivWI9w8JwmfvkERHL0fr121Oi0bCAx2FAKViZYgRw3
         +1VGHo2KUKCKtoymZUmJVvg0KNLgNSLrxM2hKoWGl1rNvtF2YDmrmByxQo4nnhZ1sziE
         c2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688401; x=1796293201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Q6Z09Hui/dS1JTsCKZUo7wukUm5qF65Apk5oQFIkE=;
        b=XECSDZa9Mex9BQl3Sl/aRtPdFeX9K+6BqeJTgiEYXtqQQELXIlq47nbWLMajTkW9R8
         AOT5qHgqOMyTsrnXHlb3FHVriehY7l05himSFvbpcKPbd0+EaQsfC5JEGyCqcuOpiLkH
         V/mrrytB0PNj4Y6wabEi8J18gcmcDzV42awV8GUZ3clrucKI3MtlC97aNB3PBJHX7ZR0
         bgs9ykdrFiX6eQFL6t2pQ6U9Fc2tnHG095OEl/+AsDHuAOuwagqItcX2wnH/FMgju7AY
         cOrNTqDc70tXPi+glsY1ZnfNCjmPTJCs6oQrgLMHFSJTjNbMU/7CK5p4YGH1ERGyWi0r
         vpyw==
X-Gm-Message-State: APuU4Z+DaFtVvq1psp7Pt9O8Rn/53bRume7nBcF/laFgvcjJLd6ezvrg
	VsRlmr5XHB6mtYPJJDntQR+DgAIuLkf9BLYTjoBLudgLfPUdix/QYXMV
X-Gm-Gg: AZFdTZe7bym9i9fQ0WgRrAuZfn8jm4YFAFy4o5VYSvwI6SZEOQhZixnicg1KhdjauZP
	l6zcA8bnot5strPa/j3mUiC/+//Cd580hxNxxYsaBiOACea5kqOQvwLq+cdatxOrls7F3pwyyiP
	cku+In6KFnsH4W/2dnt5c6+NPRgUYUmXsSI5t0l5ujecSSb0G6sv8c2DhKaCqaV2mg7mTFK0Cuc
	PxxYU9lrZiQVL+PvJPHX3tcURJtfHOdWhyV0njBFZ2LtpIOMFqopMfgsdhF7YHodIy3HwwCK5Gd
	ic1Qjs91laypsNU97sx/lDIZdvsrozlU0zd4dIZORSmqmhWxELGsC6EELoM6OuteJUpYXBoZFRH
	7XCPd47nfUs9dxHLD8Bgpalthc/C0R/EzeK9mcSubcB8Lo3b4Y8xSiEUa+vAU/7zx4QDY6cUV54
	PxjRD20zO3f92l6gx/2roMeljQfngAXDreqztibmQJJCd0JWT6G3Sdnk4RC+5wGcE2AXG1iPZvT
	C5HoBS+QxmLMJIxlp5stux2055GYsB4j/46UJfvo7/iEXJoFgtzmEF90ooaccAZ/ZhocCuLevVo
	gq6YqcUwbbYQxYbE9ut8U9mIg4PW1KYNN/kUS6H9cWcEF3j7xTETAKg4vF29dhsw
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr31176284eec.7.1795688401293;
        Thu, 26 Nov 2026 02:20:01 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm32885813eec.0.2026.11.26.02.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:20:00 -0800 (PST)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	john.fastabend@gmail.com,
	jakub@cloudflare.com,
	jiayuan.chen@linux.dev,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ast@kernel.org,
	cwang@multikernel.io
Subject: [PATCH bpf] bpf, sockmap: Clear the redirect target after the stream parser runs
Date: Thu, 26 Nov 2026 10:19:41 +0000
Message-ID: <20261126101950.1682160-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.56.1
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

A stream parser can call bpf_sk_redirect_{map,hash}(), which store the
target socket in skb->_sk_redir. sk_psock_strp_parse() never clears it,
and it shares storage with skb->_skb_refdst, so skb_dst_drop() later
passes the socket to dst_release():

  KASAN: null-ptr-deref in range [0x0000000000000128-0x000000000000012f]
  RIP: 0010:percpu_counter_add_batch+0x24/0x220
  Call Trace:
   dst_release.part.0+0xc9/0x180
   skb_release_head_state+0x1cc/0x2f0
   sk_skb_reason_drop+0xbc/0x420
   strp_done+0xcf/0x150
   sk_psock_destroy+0x85e/0xb10

Drop the dst before the parser runs, as the verdict paths do, and clear
the redirect after it. The parser's redirect was never used.

Fixes: e3526bb92a20 ("skmsg: Move sk_redir from TCP_SKB_CB to skb")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 net/core/skmsg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/skmsg.c b/net/core/skmsg.c
index 005e09121f00..4089901a9581 100644
--- a/net/core/skmsg.c
+++ b/net/core/skmsg.c
@@ -1131,7 +1131,9 @@ static int sk_psock_strp_parse(struct strparser *strp, struct sk_buff *skb)
 	prog = READ_ONCE(psock->progs.stream_parser);
 	if (likely(prog)) {
 		skb->sk = psock->sk;
+		skb_dst_drop(skb);
 		ret = bpf_prog_run_pin_on_cpu(prog, skb);
+		skb_bpf_redirect_clear(skb);
 		skb->sk = NULL;
 	}
 	rcu_read_unlock();
-- 
2.56.1

