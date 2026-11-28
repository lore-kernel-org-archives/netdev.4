Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853229;
	b=WpRMKXUjAqDZ1KqahU3QDFAhibSccG9YGAIZGTYp51LjitAGqvtU0tzGfkYdjusFAyOg
	 aVkZGwCPSeK//cHOuaWPbvdiUcqX/gHsPfR+/iI/2HyThegq6z9+R9Ntueymh29s1bfr1
	 ZfADCigZJuVhI5tjjZ6Wrr29/Sry5VjLBI9g7RXgfHVkyaxcw6/VoTDzQCYcb6dCvJVud
	 9P1bpwpyoWeCNfywHP39UAEGL+2h57R5Z4tMhGyOjlztoaF7fCmpIiVSAqOpa6t4unYem
	 Fhpuv/8rQ0bBc21ZAuCdLnQw4w7//ugmdNoSuoFWPIKEcnR1E1B7ghi0AapUhkLzIjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Q3TxoLcYBeg83LyzcKHNIhWb0GCzY+U7MfM/flKRQiY=;
	b=k13if47Jz+DHW+gLoyJjNm36fMZVU7kyuqz8Jt60AtrILvncAArOTYQALEMLVU2NOy5/
	 vYOTLIeZ4PuxDd0FVB7+nQdXaHOCGQdpD3mM7CCXpMfKEI9xqwtAuGsaomApwMYL2fk0M
	 QRttoLioLNu77bhpz51gO0Hi9U3aChF5Rwb/ASMqLRvssQlBYhG0sjZkVk8qgV8M3xquo
	 11YQg8bzDwMlczhSpW2jKtiVWsPG3bEhPRTuGCvg3YlfIO9k4CXiaxM/rs5hpQib5/OCt
	 ZgIZqELqHTZnSK7zzMI6AK8zLSpSD8jmeJYin16Y+SqQrL18jepmoelo6Rvj8dVe4Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FpjCE5VZ;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39336606A684
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39336606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FpjCE5VZ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b456fee3b2so6425856a91.1
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795853229; x=1796458029; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3TxoLcYBeg83LyzcKHNIhWb0GCzY+U7MfM/flKRQiY=;
        b=FpjCE5VZhMVJRlqQHwiXebRzmjAhafNZQmZKPx/YI74UiyWohVhPYv5c/GBTcO1JtN
         9o+H9KvKWISijUFcfwHX4OrSjmiX1JNJIFwdmyF10n7GgyrjjL2vd8d5cit398Ffs8/R
         NQvik8Bw4Mki7KGL7AdDg71CRURzq6fveYt9/UNaMMGdR6eUn15p0W4ewX4gIVKF+f7c
         RAkTAm9POLGL8n4zjRPxwvb2BQxM19W/xRgMaE2dSBHS2L3y7zIclQdP0VdFL2l88i+u
         6DdHaqJXatggp0dRD4JDlq5h6shlNsts7Yf6Brtnu+7JexZMtlzxBsd1bAec89lN5f5N
         tyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853229; x=1796458029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3TxoLcYBeg83LyzcKHNIhWb0GCzY+U7MfM/flKRQiY=;
        b=2JtNv8K+1hkW6aQKkr+IN2HbzhrevEAJlWCLjxZwzDcrtGpPtM2hSVe5hrNUy5Xy3k
         YbTZV3jZlvx/PigI07aED0VKvfTy+4VMwfB1uy8I/zFulKH+SCl2qIIukSUbW/7i9UVN
         dPho6a+IOKRJ/JyV4GrRzwQSsDuKYuo1fIsu+Ktjyir2RcJFpUmde+MjemHX+FqkYL1s
         YKZVP1DPvpGATFEgChH0Dz81z70zoW/JqLREg/wJzi7WxLdvomFk3adqfV2b7mo2ycTu
         11IvH3kVB+me8slaaca0vyrwkhcuvqOwciRDiT/aOE820ClQaf6T/zSIljHPAPt/1m6g
         nE3Q==
X-Forwarded-Encrypted: i=1; AL+hErE5BPZpVgz1YjqZzgGEHq+v1pcg+yzotutt65+mkG5vlmjmrUA4lI12mJAm5UuvRwOkl7X9eKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZdbQzMLsHWA3ThubxY0CHzwileCznMdZ8shtYOEFPzfsZEYY3
	lNJV2E2AUu2kYod+WwFCrD/BBcqfxpPtLJhdrhN5eax3I+awzks8xb+dV25AFOOWkMCKH02i7GP
	URnVXTQ==
X-Received: from pjzt15.prod.google.com ([2002:a17:90b:58f:b0:3b4:2ee8:7fa7])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2792:b0:3ac:4e18:238c
 with SMTP id 98e67ed59e1d1-3b41cb0c476mr23325954a91.49.1795853228342; Sat, 28
 Nov 2026 00:07:08 -0800 (PST)
Date: Sat, 28 Nov 2026 08:06:19 +0000
In-Reply-To: <20261128080700.3828378-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261128080700.3828378-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261128080700.3828378-8-kuniyu@google.com>
Subject: [PATCH v2 net 7/8] tcp: Pass inet_sdif() to __inet_lookup_established()
 in tcp_v4_err().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	David Ahern <dsahern@kernel.org>
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
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Reviewed-by: David Ahern <dsahern@kernel.org>
---
 net/ipv4/tcp_ipv4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 767f84d94aaa..ffc521c2b701 100644
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
2.56.1.839.g22a8290db9-goog

