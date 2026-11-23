Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405263;
	b=f78Kpyw+QTzoPLLNSFZStJMFeouLyiRGe4h4r/cu+IW3YxzSwkIAj9REWizCQ9uxwR6m
	 9vo7nZ9ncnxnZWvjIR3/8nurmV9sLrRhVqNbL4iywiHBiXAUgZ6IeDA6du8JK72e4LjOa
	 AU9A4o8Jpqv8R75dyZVUO72B1fq1rMa65DTw5iDmZ/1G+OTXtgwVtuk5QsqijR7WXMjAz
	 xk5xQU8l3LSKVrO6Wdax/1sqN7iijdR57bEIrhhL0rSy2yMeUQQ2/Pr0EJN8wHnuh/mkU
	 DZ9rAUHpjQmohm/KhpAeQbv9Y9MgXa3GmW5Ckp8np5vUG8iljKBCW4W8Zz54YJ/2ziA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I/uN54xQrauXi+R0dUK9MCordJLorId2BIMzOW5ancw=;
	b=3o6+aWKf7GLwmNZhzXQkeQCNMLL+I1a482dHidPG2ZCc5sJinnLWAgfDS02hRnNE6OVz
	 +Vcf8wt6WMLfRjQrYWEqMpUS+koynVY8ZJTKV1ADtzcFLweFOD5uBGiFLrfXvFb6lMSFv
	 6Igb9Po2ZCxjmMEwnZt/n/Pmc9MIgHKVLN/jcnMZoNLp8EW2St70lHUVA9PG/rCWZUkL7
	 V3Buy2zBUYjQ27sn2eDiCYBdWrBoJS5voQdsmPSdLYS6iPp7QTfBpAsmzwSxLPjq1rp9f
	 7UAJlXx7vmFIGDiqwuGHP9Nc/Dxxu2Q8YMcAJj16nfu0bsPm9FS0FZ5KFpaL1tLgn2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkFYhu3J;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC0D606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 03:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkFYhu3J
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-377157fde7bso977046eec.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 19:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795405262; x=1796010062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/uN54xQrauXi+R0dUK9MCordJLorId2BIMzOW5ancw=;
        b=HkFYhu3JKk7jNNj5yTVp4C+Cx267EtXSd8XhUUOv5OTbbq04IivDtsdQwtW4gz1+Fe
         bBnMYaoFWLqpt4Mad0JrEC1GNLO7y+GZQ2Ns4ExH3BJjQ3wWk8Rvm1xlVDrDfaZTPzEG
         FwhDhRaNIE8BaXlCWjkxxiAXvB2oBnVSIMuqe/qdiOg31tLh/kTzgf7+zLQtcAV4ihvB
         SR3oSk73zyK034bj4NHABEdDTagN6R8vA/cAa0QN2nOrxoXXzPa0qE5W1/C/ejb6kYNJ
         v6K0Ks2yZ1mpuI8bF3pEha/03ZFsvQJCLR0a9lKl3vMrVDIBW0X5xzvNleJnqDP95SKg
         cogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795405262; x=1796010062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/uN54xQrauXi+R0dUK9MCordJLorId2BIMzOW5ancw=;
        b=Dt7srjFa5NFux85VsIKu6bxdgPGarVoBDPj3tF2+2wL0VRcYiBXvKwbhLr22UuEAcq
         2uLMkmhvCni3mVQXnAvfQ9eXAOolkXbR/cfaxbvX5REx1NomSiBhlwikyG5JVMYlvgt6
         LLjKnrLpUYYronVWT40gIHrl+yV5oeoz4+HDmgVPNom0WQRkN9jMua4FE5+/dgC4+BGm
         x2WE6RI23pjrhe1Jt8ogQti5TpwN1h7dMY+pS7OH7wTsv6h8Or6OnLTjqrs29YWXHgwr
         fOazBx+oH88UvMqp1j53qKU4tenL6HFeFsjop4wukp+r6ozmCHhRVK1tOnYB3jTgb34L
         Ns8w==
X-Forwarded-Encrypted: i=1; AL+hErE2oT/+rD4G/8EhBvnfMNKGkkk7i4obr/t1VihJfwXAqZcvEaFMrZyuK9xYOwjyD2thHfYH/fo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HrzEYSpN+8LpR7qjatCvmPeuafjH27T5UnaghXWYOOQTDv6XP
	RbtOCZrkVGJxpjiuvVd1tTvd01AjZoZWAtGHFFJ1Zl1F0VlGzg8PbQoZ
X-Gm-Gg: AZFdTZcCHO1mAJEOUZplN4ig4HQAfjx0MZMhNpF8nD92ogsf+uDVYkuDLHyG5UmAuQ/
	nDdEJdWJYY/wU0kckE6VKY3sF42n/x6WO9TEHDPA+hQ88OXigSBvZjqzRQAga5NUVFiwHWR4BHm
	lynzuiPVo3MzW0UR9eULU6jKhGYeLZpA+mkxtxyPr3h1+MIpcqf53npQ2tCLxTl9sFu/y1BSPDD
	nYuFNza9xUktlWynDS8I10mbFmxHEZV7aH86Xvtio8u77fhNZI1I8tQr535ma7DnYkQssmQwU5G
	2afTVwuSp9RY2y8uCXXYyfPd1XJx+marYJok4NLugI4/aDG+0aXqXI/7B7AL2FsxKy/2As7QNGH
	yNmVNyYyJ7PYLBGkXVFosQPi22TdwzPdiFR7b9MHBvffLUPmPWccIAZUMXrIY+nmhlCFlhVCcz+
	B1EtCdHPN+WOLtZcxjXSUlGEa6kUx3XqYq5z9BlHJ16k29IHGiXcZt/XgIwVEK9TRC79M4/3cSU
	QoNmy9FETkbKeFE6wLwTq5CN3ASS5XUl6NNusTZHZRxeU9ndEAA+urqbFMYtRPRm1X7CDRZQppS
	YQ3lJ7HkQeMQYAT/3wwi16E02K5g1mUgII/6HOPLMTAscZcs4iiVjzlmBBmAQ1sHlGclhlXizjb
	pNPH5IKnzWIx8t6DDzxbxB0yWmG7w8tiRs8SyoJj7vaiOFpzuDc3+P1JRWDM=
X-Received: by 2002:a05:7300:bf11:b0:368:7c2d:a612 with SMTP id 5a478bee46e88-3856fe59b16mr10742137eec.10.1795405261632;
        Sun, 22 Nov 2026 19:41:01 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm29489364eec.7.2026.11.22.19.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:41:01 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: edumazet@kernel.org,
	ncardwell@google.com
Cc: kuniyu@google.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	0x7f454c46@gmail.com,
	fruggeri@arista.com,
	noureddine@arista.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 net] net/tcp-ao: fix reset key lookup for IPv4 segments on IPv6 listeners
Date: Mon, 23 Nov 2026 03:40:47 +0000
Message-ID: <20261123034047.56745-1-dennylin0707@gmail.com>
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

tcp_ao_prepare_reset() looks up the key for a reset that is sent on
behalf of a listener by the address of the peer. It takes that address
from the IPv6 header whenever the listener is an AF_INET6 socket, also
when the segment is an IPv4 one that arrived on a dual-stack listener.
The address is then read from the middle of the IPv4 header, the key of
the peer is not found and the reset is not sent.

The v4-mapped check that follows does not help: it looks at
sk->sk_v6_daddr, which is the unspecified address for a listener, and
it runs after the address has been picked.

Take the family and the address from the protocol of the segment
instead of the family of the socket.

Fixes: 06b22ef29591 ("net/tcp: Wire TCP-AO to request sockets")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
 - Take the family from skb->protocol only, do not read sk->sk_family
   (Kuniyuki).
v1: https://lore.kernel.org/all/20261117215554.68071-1-dennylin0707@gmail.com/

 net/ipv4/tcp_ao.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
index bb7bbc20ba3f..857b8684e01d 100644
--- a/net/ipv4/tcp_ao.c
+++ b/net/ipv4/tcp_ao.c
@@ -799,8 +799,8 @@ int tcp_ao_prepare_reset(const struct sock *sk, struct sk_buff *skb,
 		return -ENOTCONN;
 
 	if ((1 << sk->sk_state) & (TCPF_LISTEN | TCPF_NEW_SYN_RECV)) {
-		unsigned int family = READ_ONCE(sk->sk_family);
 		union tcp_ao_addr *addr;
+		unsigned int family;
 		__be32 disn, sisn;
 
 		if (sk->sk_state == TCP_NEW_SYN_RECV) {
@@ -813,14 +813,14 @@ int tcp_ao_prepare_reset(const struct sock *sk, struct sk_buff *skb,
 			sisn = th->seq;
 			disn = 0;
 		}
-		if (IS_ENABLED(CONFIG_IPV6) && family == AF_INET6)
+		if (IS_ENABLED(CONFIG_IPV6) &&
+		    skb->protocol == htons(ETH_P_IPV6)) {
+			family = AF_INET6;
 			addr = (union tcp_md5_addr *)&ipv6_hdr(skb)->saddr;
-		else
-			addr = (union tcp_md5_addr *)&ip_hdr(skb)->saddr;
-#if IS_ENABLED(CONFIG_IPV6)
-		if (family == AF_INET6 && ipv6_addr_v4mapped(&sk->sk_v6_daddr))
+		} else {
 			family = AF_INET;
-#endif
+			addr = (union tcp_md5_addr *)&ip_hdr(skb)->saddr;
+		}
 
 		sk = sk_const_to_full_sk(sk);
 		ao_info = rcu_dereference(tcp_sk(sk)->ao_info);
-- 
2.43.0

