Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893752;
	b=HRAiMqZVU+ORpoKGcfcqKRd7QYKtk/AkfSXbUV2g5WnqY1vbduli2ew+m4woiYwJdLPa
	 yRQO1Uop+rMW2YpAk3Mn4Rbdekqm1JjsHRAEjIV8BBv7njFE1YaZ5JgwVqblvuNpJgsix
	 iCAOnZK6ojvzwV0QnhK0c88+MhWWcrnF9q2S7T5/qNR4T+dKRB0mydAV/KDIpH9D8qz0n
	 We5Ow8/Pm3jaHDJofluMwloxLm4kZ80jdN/lPcjG/97p5YUHHbV5xF3xryDh8cKSERn2n
	 +nAvvbowD+vPZBarQZCbcOj/UM828XxxefY6sGReSGNvtxHyQDKLJQBK3Go/kRQNUhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Uw2bn3q6zG55w8xQ8PBAjrgMAbWbz2T8OH9uw6q+GhI=;
	b=C5FoGxMDFZlJONBym4hJ+1SvbY1/kblO86U+7yuJkYTcDxyNbI/5syrneKiGEXn7gcR/
	 p8s6vyUZqRp6oTE9doQ6WoScjZmPJBDnPC1ybNS5dhq+lhtpPVcO/UMaZx5IMzlyhvpIk
	 sZsJW9ySKkYPLwpdmIE5pNl68TJ9sPBqNxtXHqEiSVE/8WI/dZjbbKXAsXNgTkos+jY58
	 gS0lsPkCEF79ySC1Slws491A9ZjklmjzoEyMRp7KpOZf0A38cjB2g7l/emHVIAJl+4DAF
	 iXga+0nmf0jCxZA/S16hnD5Nlo8amEqzYl0Kp30nGuC1ej3yQ7rEpwLRJQINqsigSHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TWD0zMum;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F0A606A88F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31F0A606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TWD0zMum
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cddc4bde4b1so1912599a12.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794893751; x=1795498551; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uw2bn3q6zG55w8xQ8PBAjrgMAbWbz2T8OH9uw6q+GhI=;
        b=TWD0zMumT78z2MJE+KHeDQBQe4RSth4kWY9qOagXwMwtzyMf7yi3tdVhAREotoWbud
         hrNG2A0OFQs3RSo+9GRgJpRPUwCntlQx8cv0oreeGSkFN4bqapbpm24xdwU+NCKVWnCv
         AI7/F5hqIfdo0OudZW9Hd31As0otcTCsrEmUJWCpDu878QUkTfnTypRh3W+wpqaYQT/S
         bWEBtOfPIH0nSMojGDoCmxCSfxJtS8U52o+kt1uaQyAAiqExJPyiyedEAVDV7Owcf/ia
         RdPjXEBIOBqsY2e+yEYzPg+X6zszRrOl6tOUEJTGNJDQFjA1pSq9pEAlKnYD3QukyOI+
         25/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893751; x=1795498551;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uw2bn3q6zG55w8xQ8PBAjrgMAbWbz2T8OH9uw6q+GhI=;
        b=xjsWojh8/AjlJ5ciZ2DU/D5QvNaKSbcNTR8if7RLnRoaBmZUHN9vTlDeiQHInT0JWm
         ttA5nLLbMUc4EritK9n/6xLupQinEKWHMX+svX3qJvrkUzAXXdrucTa+fuZ/i2bf7tSg
         8+fCKJiAVnoSJ2PqFzFw92vrPW5l0l/EzjH0CDbg60LXAy4KN3pqJbdMpmst/G8R3CE/
         4vB/FkCaLgFyl76PwoxQgU1pSu1j1oEKcQ1umrKDay9MgRl7N4UxzQj9BNutYm4GuERC
         twrgZCXsIa7piAFW5a3JhNH85Ktg0dmbQyusfjv+GstN/OJviNN2ZPGAYDwTKKwwsbJ+
         vyJA==
X-Forwarded-Encrypted: i=1; AL+hErFIw4QvIUnwCnmNZRtNNagmteISCvH3lAbLsPvbGLrK12lSZQQVRydsAt6jxNtQQ9d2WCxfjCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kk2QQMxnPkgVEX+cD8K1ya4wNHZFKuZ+4vMvO8Y3cpDssWOHv
	2dkfxsZuhvK0LuuooDUh2hrMkOItJgLvOpxe/FsmbTVuIVJ2KvGWHnXjEywf6HZc+3yuzeT+BHh
	B3xMGqw==
X-Received: from pjbbh23.prod.google.com ([2002:a17:90b:497:b0:3b3:b7ac:4a2e])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c10f:b0:3ac:4e18:238e
 with SMTP id 98e67ed59e1d1-3b1b0ccf4edmr10910909a91.46.1794893751382; Mon, 16
 Nov 2026 21:35:51 -0800 (PST)
Date: Tue, 17 Nov 2026 05:35:25 +0000
In-Reply-To: <20261117053543.84032-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117053543.84032-8-kuniyu@google.com>
Subject: [PATCH v1 net 7/8] tcp: Pass inet_sdif() to __inet_lookup_established()
 in tcp_v4_err().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	David Ahern <dsahern@kernel.org>, David Ahern <dsahern@gmail.com>
Content-Type: text/plain; charset="UTF-8"

tcp_v4_err() passes 0 sdif to __inet_lookup_established().

So, ICMP error coming from VRF can be leaked to a socket not
bound to the device.

For example, this test fails at the last assert because the
socket receives ICMP error:

  --ip_version=ipv4
   0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
  +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
  +0 > S 0:0(0) <...>
  +0 `ip link add vrf0 type vrf table 10`
  +0 `ip link set vrf0 up`
  +0 `ip link set dev tun0 master vrf0`
  +0 `ip route add 192.0.2.0/24 dev tun0 table 10`
  +0 < icmp unreachable port_unreachable [0:0(0)]
  +0 %{ assert tcpi_state == TCP_SYN_SENT, tcpi_state }%

Let's pass inet_sdif() to __inet_lookup_established().

Fixes: 3fa6f616a7a4 ("net: ipv4: add second dif to inet socket lookups")
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
Cc: David Ahern <dsahern@kernel.org>
Cc: David Ahern <dsahern@gmail.com>
---
 net/ipv4/tcp_ipv4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index bc909fedda3a..35a1309f8b21 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -504,7 +504,8 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
 	int err;
 
 	sk = __inet_lookup_established(net, iph->daddr, th->dest, iph->saddr,
-				       ntohs(th->source), inet_iif(skb), 0);
+				       ntohs(th->source), inet_iif(skb),
+				       inet_sdif(skb));
 	if (!sk) {
 		__ICMP_INC_STATS(net, ICMP_MIB_INERRORS);
 		return -ENOENT;
-- 
2.56.0.679.gc527c65306-goog

