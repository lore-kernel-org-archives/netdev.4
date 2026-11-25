Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610539;
	b=Vwj2TT1VkkF77WlR4NsY5Vm2nRo9C+JSY8vz1fRQ4FCP5zLdB07Bp8w7j7HyTlFWe73d
	 SR89Oy7F0QGID841MCJET8bsVakPlDCKEhu4xc5ZvtqL/YBkYlvEWskvwEp2JuDGf0lHa
	 leyq2A2kPMV2LD2L0d9/lprhbUSPSkpCnwYkVHk18rBCU/aK2PEU4bHm9L/IhFuP3EMnD
	 bBOc5oqYBSZlutvRalVZWv+OJDycHxBnNQWwWrSMMPUmUa+nIOuWa+ySCmozVn43an5Hi
	 pxeDe6z8AKzfrjLlyoFsniHgSy1aQl4fLaxqPyOnRll5qG1h/LWC1/tfcyYiwG001Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fz1HrHRhCPEILfFit7EgeydABb/j/p9kGIL6sGWoE88=;
	b=NUqg2xKSQct1V3l9OW8Ez85hilnTSfJgBfvIgLiryxGXpdMj123rXN/UN14iW8hrvNT1
	 Rb0aYcaRdPTLzWd0t9EhuKj9vh8zwlzywV8K53xtIS1HD6tUM1/yukGj1uKBhDTEgNDk1
	 W5mkqstMsf9Vsv7BxQJR1gOYE2X9iONxrgBd9FceMn7Ksa/TdsKvoahcStwwjmyIW7NaL
	 XVHgl1kUnNvSkU80eBLBcEHMFhixAKZQXE0cDgq0ybDJJj4v5Y0J/cZ1o0IhxBxE4m0E/
	 yGNTlmlR1lflwP8nHf5/qI01fnuvuFD7XtuKUKMFmhgy8/j9cVxZax9muwW+mlp8cwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GHV8uFYW;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BE7606A32D
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37BE7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GHV8uFYW
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3863db981d4so7960175eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 04:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610538; x=1796215338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fz1HrHRhCPEILfFit7EgeydABb/j/p9kGIL6sGWoE88=;
        b=GHV8uFYWATG6RH123GTMku2BDs1rhKCmw9ndUPvy6nQTokgKOKcwk2TeFVyKVWpUv4
         g9Npy1QIgamKzL6ZIL2UmDgMfFLJo1ch6LoM4/RybjaT6LP0zUls7VCbqDymuF1lVjpT
         L0kQnC966QcIH+l0AGg1tfpD1cgrKRdiCYt60N1hpWJqGNOcHjBlQpl38X/hWaflMHFj
         BgCQwikZVorLmWhoV/ahGEDU8B9f9cazTIFLXftBwBJIwj7xrPMJY6MvXF6pt6VfhkI3
         uE1ahApK8jIZFKbxBy6ZV2MLc9MZnuR7JgY5u5bx56visACnasTg11kXOCeR5tZB9+PU
         Zvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610538; x=1796215338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fz1HrHRhCPEILfFit7EgeydABb/j/p9kGIL6sGWoE88=;
        b=cvY5WN/HfmoUIdMEHoGTmUFI/L1O2rtDWlpqlzfefFUP8pPz4ryiiNO/oXuGlVnKal
         PLDWfkCgjbQ9HvZH+MzTFDqbl10nXZiQfX8HlzLnLECfe2C2LjrfNeWhj7+eoPUFaOyz
         IaCtcyWgpfxZZGWDknpRsdAg8E2qXUb7U3PAdLbhLhl3HBir4bjpOmFnClhF17yr0fDA
         nFU0UiKUM7DOElPggdq3eICqAqS+hB76o5y9UJ2AZCIu+fQHKCJ/ANpwHMHY5mm48DHE
         75kLR9wYqLQlAZz8dlqo95Vh7CVYQtP/9PTgY2AVJtgDQsDH5NhOLZ2JKgZNUshXRo+a
         D0lg==
X-Forwarded-Encrypted: i=1; AL+hErEEfSQw99jy1ERSD7c2ib0Znbvn+F6/D66DcUKxf5IAC91aX8VtjCCL0F3o4FqL4tWYGgPsrH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z89crBGJJ4QwYrl3plAxSXw22JZ6Yy4W/VnMx3kH8t8RmIY12Ig
	UK5hNKHCHXB8ONR1O/JK/WkHBsLBW3WaDO32w4vCmGuNmWsS3SVVUHM1
X-Gm-Gg: AZFdTZejJ4N9z49s4VSSkw1Lnm0s2Eiv8YT40UKWHyclPygWF2zIHIr2sohU4ILiM/m
	vscnF/Ijk/9fGNgDH+1ulUdhvw9nGvZqxDcJ37mbGHeh6xkQeKP9k+q3AbLAC5Cb6H2fshHSlDS
	Syuha53ByDz8D7zaI5cyabbkoEeMHGdnTUOSmdVY1QVb8LSY1UEFFsyHDnDcB7GZD8ttFcSCN89
	B6aQgE7TzZQ22Qx3vSf0c2YTT7VT0gb/wVLh4B/+b+6sWlH3CqyM+DFcnzNibiQ7WFnyi5Qg7hC
	YBlWLo0uH0SBbbpyVXvGuxZ1BOmjSfHHrG1Vyn00GujQDQDapR85CAQmpqEAzMYk7EMnEyGrpD8
	ppqD/Fovs6reh36JnNdBmlrciiwMeUboprXxpDPBigkNwd6EwvjFL20lm8BWy1mTgxiUztEHEw4
	LDVYcbl1JYOPzUEgVPqDALHhBE9RLtCKr+6eFGlzBmujgV3qYzfgOnebemL0qXh4CRDCOYJaP1Z
	iOvN5NtN4SY1l3MnCFGqWvpJLoTAyNfz+9kAOQ5bTsm+tXLafkvWlUHegF+4hnLUrL65vnX83kc
	Lsy94epE0M4GuRyPygF4mcZiY+j8uVSM0TNBVD4RMPT6lklRBg==
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr11019596eec.8.1795610538260;
        Wed, 25 Nov 2026 04:42:18 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386d605c894sm2132195eec.2.2026.11.25.04.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:42:17 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tcp: do not BUG on an unreadable urgent byte
Date: Wed, 25 Nov 2026 21:42:11 +0900
Message-ID: <20261125124212.4145820-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
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

tcp_urg() checks that the urgent byte offset is within skb->len and
then calls skb_copy_bits(). The byte can still lie in an unreadable
Device Memory fragment. In that case skb_copy_bits() returns -EFAULT
and tcp_urg() calls BUG().

Mark the byte as TCP_URG_READ when the copy fails. Leaving
TCP_URG_NOTYET pending lets a later segment retry the old urgent
pointer: the unsigned offset can wrap into that segment's TCP header
and return a header byte through MSG_OOB. Clearing urg_data instead
would drop the urgent-byte hole and make ordinary recvmsg() hit
-EFAULT on the unreadable byte. TCP_URG_READ prevents the retry and
lets the receive path skip the hole until copied_seq passes urg_seq.

A custom LLM agent developed by the authors found this issue.
The author manually reviewed the root cause and tested the reproducer
and fix. A test-only netfilter module put a loopback MSG_OOB byte
in an unreadable skb fragment. On a 7.4.0-rc2 KASAN kernel, the
original code hit BUG(). The return-only fix avoided the BUG but let
a later MSG_OOB read return a byte from the next TCP header. With
this fix, that read returned -EINVAL, and a normal MSG_OOB control
still returned its byte. A test-only KUnit case seeded TCP_URG_READ
on a synthetic NET_IOV_DMABUF skb and confirmed that a successful
MSG_SOCK_DEVMEM read clears it. Device Memory hardware was not tested.

Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 net/ipv4/tcp_input.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index d9a66a1342ef..50c0da17923e 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -6390,8 +6390,10 @@ static void tcp_urg(struct sock *sk, struct sk_buff *skb, const struct tcphdr *t
 		/* Is the urgent pointer pointing into this packet? */
 		if (ptr < skb->len) {
 			u8 tmp;
-			if (skb_copy_bits(skb, ptr, &tmp, 1))
-				BUG();
+			if (skb_copy_bits(skb, ptr, &tmp, 1)) {
+				WRITE_ONCE(tp->urg_data, TCP_URG_READ);
+				return;
+			}
 			WRITE_ONCE(tp->urg_data, TCP_URG_VALID | tmp);
 			if (!sock_flag(sk, SOCK_DEAD))
 				READ_ONCE(sk->sk_data_ready)(sk);

base-commit: 37fa509e43ba59d7c329025436e8ea64bdf089d7
-- 
2.43.0

