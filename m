Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795825874;
	b=c3EGrnq57upK/cq+46tKyWlD3jRmKAwEd0Lg6QRhJZe9Y8PDfaYDf4Z6XqEU7gXiJZDw
	 4bp9yPaWmMfqC6iksbvJMxMQqGGJA5bZDuHlFa1ECVDpbBs/NuE8EIv1+3VGKPoEeNsz/
	 pCdfzRsw2ny4XcMHdDH7ftZrvtmiuYW933K3fR90PDt58qT/HBCi9T1MJnrA1v22VSy2T
	 GV3gP3r+ZMRc5PWHmHvF+qkzu15F65qkIJooliA1rAnl0DRNT0mZKxyBc6uazXKViulFK
	 vH6XjlslYgz6Drm5gKHgUyYHRoZhJ9K1RtwOti8HH4OptbKv6SD7hNjvcefgzxg0K/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795825874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=81YL22Y23CJWcBybUvGyAQqGzodpMZQhGel6a2MiDuI=;
	b=e7ABGMWuOs4XuzFryyi/OK+dd//2k1jgM/sYAboogLMeAbArcTu4VD0DaUaiK5VLgEVH
	 ASpUwD9SaQ+V3jnfZO0rkcUrqhzy0ltuOI1fmXVgR676RIAwqP5JiKifta/2+GLV4dKaN
	 B2I1SB5vJlBlz6bKhwJjEILq0qrq2GBhZAtgZql28/vKtZx+9f7j/WP+TkpOgsm8o/bJN
	 Up6l6DBaIkRJ79c1kbt6stcERp9H0MZjEba15SfwZdf66XTgAUWjyDS8YD4ayd4A51WYv
	 zZGjtWkYmC+wtny7xtq8ssL+88gwvmTEB0+HHbN4zX1GWcXDp9Lo6mArewPRcDU4w1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNjW0tJ0;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F12606A31E
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F12606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNjW0tJ0
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a9f9473029so6494017b3a.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795825873; x=1796430673; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81YL22Y23CJWcBybUvGyAQqGzodpMZQhGel6a2MiDuI=;
        b=aNjW0tJ0BAuRPl+EDlmMczZaANVoX0nyry2zcMGDgCGYm7z7g92SLNdPlJLn6XlJIz
         XY6fVJfkv8jEc5LSLjoc3Kx8ZPrXhUxw+BD4gMM7VRtafZTPjymVsRmWZQmckQsvdknI
         h0DUZtRb9CjaUFtyl2TPmMJ0tAhGAgE4cec8Z+RhE38qxIwjC9bKX3Ezu8XOBKqm/G2O
         C87iegPJzCJT+vSaqFdlGdfUmHZmtyqhLuWjVIOQ9fzIPFZ9NUUqVEyKlbh3LnLu2uLg
         5OhPtVpS9GAqKr5WdZXTIxbjUCpkAfFo0wG9WnmfQYEGim6Lcv9ncbCKobH5CPZtbKVj
         HEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795825873; x=1796430673;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81YL22Y23CJWcBybUvGyAQqGzodpMZQhGel6a2MiDuI=;
        b=EGe4qt8Qk0z5E/PJZ+YoINZqZir9xU/l1gR5h7HgtS6F3tNQTkzH0wSvlYDgUHRccU
         1pXAvPZI8diIAzCTtjVUkloJG2JEKuklpaR9Ve9+Dxe4X6QLTnyN4VnBJO0rdI93sk60
         3tdJTtOo96shs1XkicOt2QPPL/VzHHAAJdM2KJsrg4P0P/QyPbAZqMMps89+BWkd6fvi
         rIRuAgwurGySJArnd2ySz5AXMDG3Z3eDADvvgnkLeILEyyaUDFev6l+5cGYVFfbLu4BB
         nPglphiluXz1J6eZNj7XJi5n3CUj00maWuqB6bKjW0vX/kQ3Jqg58m/BxXrtk1Vbur8i
         Iy9Q==
X-Forwarded-Encrypted: i=1; AL+hErFLe5uGooBLjlhLkPhbmYj66xgqEMhzQzu9YN1vrlQMfbaD6mWnblk0Xwr6/YcnucwUuSZTQRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fyRFZVUDH0LyipsjIfdmJXO5lHbJEyeSnZA2sdKoG0AcjEcR2
	jHOFjx16zKVngl/JnBj9aofDiJ3ZCeng5mZL23E1WbzukHRTevKsDJRa
X-Gm-Gg: AZFdTZckJL+m8FZyhM9bm20TWi2+9cY/IufNmNFQZQyDClsT0m94OWR6oBwFX3xacF0
	9/ZgyHKyY1ShnIkwg/LTf6Yjhks+wXwz+/wjz/jlfbzXlI9oi8HH5A1kdm7vBVDpeqaHstQRo1x
	DaY/STajg4j7OW81P1UJNeWM9Py42c2E/jQTv7TKWDF4rIvrN9y43E9gPzXABTip1YHqn3jQ8En
	ublZJosZNLGQw6lKncQFSZIe6T5kKJyb9yHd+WMl6TRTAW1Rb/bfKPIZqkREKfj2fWV3Yiofd44
	47UoQkCazC2ZpzkcjXyK4Be6a4hSCkELPG3ZfYFAvAvJM9FOq8TY6J07JBEDSqIE5l8i3g0je0u
	qsLMZSsan1QNBSiY1GjbabnjO05tteOhy3DCV0ey2Lf0ojyteadJUBbF9hFEv5Gwr/MT9vRXqXk
	c1RZvqXVKkTYZrK9TJXV5xqCosGIr+wJATOQilZ+Nl062YfXuOK7NLuwlgA4cpj7WHgqXUQDr20
	Sz5vxjOMMfn+fcbroi3bIot7gI2yUxrJDc5ISA3tRI9H6s+uxzbuenfw7chT0wQOkFh70cAbSuY
	WNKEk12f+CjDI2mBlfyNuuFOVjW2ZqrYmvLVjyqXzoDfZBq7yCgg9VqgL2x50ntmZ9PPJ/yfldF
	D1Y8CFSD5Y/PzS/OGgMRT10ch8AtKdplQfQ==
X-Received: by 2002:a05:6a00:2d0b:b0:881:4b47:f305 with SMTP id d2e1a72fcca58-8c8794b9136mr25471832b3a.5.1795825872876;
        Fri, 27 Nov 2026 16:31:12 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c228sm13235924b3a.10.2026.11.27.16.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 16:31:12 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 00:31:11 +0000
Message-Id: <DN6F54C8AZSE.3QLYZS0114Q5L@gmail.com>
Subject: Re: [PATCH bpf v2 1/2] bpf, lsm: fix bpf_setsockopt() on a half set
 up child in inet_csk_clone
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Stanislav Fomichev" <sdf.kernel@gmail.com>, "Jiayuan Chen"
 <jiayuan.chen@linux.dev>
Cc: <bpf@vger.kernel.org>, <kpsingh@kernel.org>, <matt@bobrowski.net>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Stanislav Fomichev"
 <sdf@fomichev.me>, "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>, "Xu Kuohai" <xukuohai@huawei.com>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
In-Reply-To: <awcUm4PvuYb3nGxM@devvm16445.scu0.facebook.com>
References: <20261125070330.16625-1-jiayuan.chen@linux.dev> <awcUm4PvuYb3nGxM@devvm16445.scu0.facebook.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 09:04 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> On 11/25, Jiayuan Chen wrote:
>>  2. Make these options work. This needs the child set up before the
>>     hook, too much for a fix.
>
> What is too much? Moving security_inet_csk_clone to happen at the end of
> tcp_create_openreq_child? Or is it more involved?

Here is what my bot thinks about moving the hook.

That spot fixes the timers only.
The callers set up the rest:

  call chain                                 option works after it
  -----------------------------------------  ----------------------------
  subflow_syn_recv_sock()
    tcp_v6_syn_recv_sock()
      tcp_create_openreq_child()
        inet_csk_clone_lock()                <- the hook is here today
        tcp_init_xmit_timers()               SO_KEEPALIVE, TCP_KEEPIDLE
      newinet->pinet6 = tcp_inet6_sk(newsk)
      memcpy(newnp, np)                      IPV6_TCLASS
      tcp_ca_openreq_child()                 TCP_CONGESTION
      __inet_inherit_port()
      inet_ehash_nolisten()
    ctx->conn = mptcp_sk_clone_init()        SO_SNDBUF, TCP_NOTSENT_LOWAT

There are two callers, v4 and v6. Let's call the hook right before
__inet_inherit_port() in both. Then there is no need for
bpf_sk_clone_setsockopt() and bpf_lsm_clone_sockopt_hooks.
SELinux and Smack shouldn't care. They copy labels from req.
The v4 route lookup in between takes secid from req too.

mptcp sets ctx->conn after inet_ehash_nolisten(). That's too late for
the hook. subflow_write_space() needs a NULL check instead.
bpf CC hits the same NULL and the patch doesn't cover it:

  tcp_ca_openreq_child()
    tcp_set_ca_state(sk, TCP_CA_Open)
      set_state prog: bpf_setsockopt(sk, SOL_SOCKET, SO_SNDBUF)
        subflow_write_space(sk)
          mptcp_write_space(NULL)

With the move SO_MARK and IP_TOS drop the cached dst of the child.
tcp_init_transfer() looks it up again.
Backports need more. dccp and chtls need their own call.
IPV6=m needs an export.

This replaces patch 1 and goes on top of bpf/master 14f6b10422d6.

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index 9a3b05e..759f826 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -1276,8 +1276,6 @@ struct sock *inet_csk_clone_lock(const struct sock *sk,
 
 	inet_clone_ulp(req, newsk, priority);
 
-	security_inet_csk_clone(newsk, req);
-
 	return newsk;
 }
 
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 2fc92a7..d03b50b 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -1761,6 +1761,9 @@ struct sock *tcp_v4_syn_recv_sock(const struct sock *sk, struct sk_buff *skb,
 		goto put_and_exit; /* OOM, release back memory */
 #endif
 
+	/* The child is set up, but is not in bhash and ehash yet. */
+	security_inet_csk_clone(newsk, req);
+
 	if (__inet_inherit_port(sk, newsk) < 0)
 		goto put_and_exit;
 	*own_req = inet_ehash_nolisten(newsk, req_to_sk(req_unhash),
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 5c7ed38..d704d98 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -1516,6 +1516,9 @@ static struct sock *tcp_v6_syn_recv_sock(const struct sock *sk, struct sk_buff *
 		goto put_and_exit; /* OOM */
 #endif
 
+	/* The child is set up, but is not in bhash and ehash yet. */
+	security_inet_csk_clone(newsk, req);
+
 	if (__inet_inherit_port(sk, newsk) < 0)
 		goto put_and_exit;
 	*own_req = inet_ehash_nolisten(newsk, req_to_sk(req_unhash),
diff --git a/net/mptcp/subflow.c b/net/mptcp/subflow.c
index 00677fb..a0fd3ce 100644
--- a/net/mptcp/subflow.c
+++ b/net/mptcp/subflow.c
@@ -1602,6 +1602,10 @@ static void subflow_write_space(struct sock *ssk)
 {
 	struct sock *sk = mptcp_subflow_ctx(ssk)->conn;
 
+	/* bpf_setsockopt() on a passive subflow that has no msk yet */
+	if (!sk)
+		return;
+
 	mptcp_propagate_sndbuf(sk, ssk);
 	mptcp_write_space(sk);
 }
