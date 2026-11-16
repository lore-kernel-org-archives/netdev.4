Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861990;
	b=r6YuEQBWKwvwc+rZLTppgNfsmiYRnHtbqaGlfUbB8fJWx5cSk51PLbD5ycaF7CA90ecy
	 PbkPNT5UrKrTL0FmAZXJekG0cHQFYTwS+CnOFa/SuIvEJlMBAinNQhKOLaHTAKSTn3ynX
	 tfasUbbzUgHPBVaGqhy2wzRiMcRevzZvs61Ev6tYw+QOaEtOgyiM4yk7As8SzTr9KpYtF
	 etK66yS7fgyoPz6+ikU4eWFPFnoqRp+VgzGo2/gSFOwO81aHWYcyeAhmHDOBO7jIrxgzF
	 H1v6+PfmxlplzdAps/FeGLUa7iAsBB9RK3TFsvhtMcys/sDnKsACOlvh3IrYwqqpxLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=8JYetNZ7DheLCOUJdiDwgn10I8Vfpkp5NSU3Bw4KcF8=;
	b=OqMXtDw6WM9YxFYhI0FndFHwx3TcXcd9JHKg4IVHBdGrEecuANY75f56KI1RCGcjjFh6
	 bwwOD0rM8COPQovgfu54YK0qy+VDJ8mRDc9g3rPmERvjWiHqfTqGwGpvmpbMiBBvne+oF
	 oEykqge+EIFmfjkWftZiv4prr4OzpPNC2bvecV9pCSiFRdbdf4fC5O4CwSW2Fb0cdoGbg
	 fbNSODHvEZxSNq86ZgZqRj3s4zio75rHoC9FXQiAgsuQk7HzSM/foBYgXJOuTF/nQJntN
	 p5iuWIKE/hEQBadgdBMMgt0mwvfnMJTCVGor2tJvd9s26Ge1fq5IkoWAHh1Cs54nE/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hckj8bbs;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18EF606A32C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D18EF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hckj8bbs
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso413512a91.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861989; x=1795466789; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JYetNZ7DheLCOUJdiDwgn10I8Vfpkp5NSU3Bw4KcF8=;
        b=hckj8bbsYR69OuJ0X7cChT8JyxeH6GKENi4lyX+/gX5Kpu7Sp8sojv46XAmFyGR4pW
         vaoM5SMWVpNj5VMKjSTPt1AIEHCHEKqNVtGzkNpWcXtqZDQOOVywb+VyQydHpUH3jQm3
         zn7TSBI91dLuyOizrg8Tz5eU9IYKMOZ9I1Dwr4/4TV/0K4PSWKgCExt0dQrbJNyKSgtB
         igCgIFhFlleysNhB5OTPPacuub2xJXz9KU98OnKQdloD7efNBOnv7i68lwJoJysh2Jk6
         n4oR3Oh/47F9ooTrcrguQhQw1b10nJuR0zGIm5NY2bmXF3YXcRMaw7pLu3Mj6j8+IWK4
         SBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861989; x=1795466789;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JYetNZ7DheLCOUJdiDwgn10I8Vfpkp5NSU3Bw4KcF8=;
        b=CAN/wpSAzrZNmN1Kk5toYu0gKFwiJoSYbK8wSIFD8aH3NLEoWydvdNjpEPgbXW2zxO
         Jy8PZjJZD1l/Qr1/hMTaLiITmeLLJ7ft6gwkj1gAWO22MhsPIsRgqJaUfw7plbPPqIK/
         nHFtirk4cuezOgLTpobpRnNLH0h1cxqx54kpp0SsoYhaOW2NP7VZQlco3hEXdboZjI53
         qY3jxowZ7SrZ8FMGr5NCtPWcX30JKJGrfKm339y4RAxzPZmKOuqV5E0Ku0hQ2UQXSWTM
         oh88DQ5ucPRBFMM9JihMQ6V9BPol79Ewf7LGEjWkMiyEvLdElxXT9x43+v0chQENYPfP
         kw1w==
X-Forwarded-Encrypted: i=1; AL+hErFZ6GETbEbgwkWy/e6nk00LJwNfXbdmaxOT8ceB6tvSBrGqbxsuf4ILjNIGgyl3f85x4v/rdWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D/Rz63vOMQ3nthpq2mTHbSFdBRHQnnlmK056/PGMaFPhyCRT7
	kx2SbX4webnPcPJBTVcCKVsA9rMiAb0n+8mIpIvy/CtO16jjhARGgqr0
X-Gm-Gg: AZFdTZerg80CVnijWgQSICYcoZTfK7UoD4/Tl7UGvheXY4PQS22/y6dY/POxLTaNkdX
	YE2ZjrpeESRq3qlqWnKOWKifi+4tHW/7SFNeIDFvau7AHXdvlVX4y0Vq3jbVXGHC0wKgxPiU+YJ
	VFktWUqv5YYofSHyJ5tBoKXSSdNiRXApb2v0ymC2iSUOs1qbalepQD6pQXAs6OVT8bUB4iE+XHg
	Xy2si9JRL+QdbDktHPu5Je4AGbWTJR1ekKoPa4VMPn0Kiim+kNVeqJ45Qqw95TDKc8YouFR/WyA
	kRT7XzKych5JHzvztLHa7ct1oOxOsnbb8Pb9JasUPo/S3Ll7IEnU8IglTAPuPxGQf2ua9yS6+3F
	HJl30xAzAmtgVbMWAkCVF0OZ1byIGbYbe+Zz+EjKzNEKZ1a3EgN+fKAXwvmhGDY1n8H48rESTgp
	Az90I6S4Yg+tbN54G263uAGOEfbWWai77HiMO4+kFP6ivJdJNu7/LwlmSwoOmSzXaSUY0AobKLG
	KVbFrd51PRgWm2zU4V/0Yl/3jQqe0QxIgwR6X/bipsUfFT6I51HjVk2CANRHDGQndKpVNVtYdXC
	FtSTtEo4W//LEKsFuFeHBPQTdcwdEJ/+HASK5rUDYO3SOmDLBuGuaziY3GUYyV7M3v8btRDK+NI
	jIuJHG+VZRDiKIJYxGXY4yM09mPUom3XGjA==
X-Received: by 2002:a17:90b:4d0b:b0:3ac:a7ee:678c with SMTP id 98e67ed59e1d1-3b1b07e41aemr11138946a91.2.1794861988884;
        Mon, 16 Nov 2026 12:46:28 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe8b263sm786352a91.13.2026.11.16.12.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:46:28 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 20:46:27 +0000
Message-Id: <DMWXH28YQDYH.1SI4Y5WQ7EPSR@gmail.com>
Subject: Re: [PATCH net-next v4 4/4] bpf: drop the stale dst when
 redirecting to an explicit nexthop
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jamal Hadi Salim" <jhs@mojatatu.com>, <netdev@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Stanislav Fomichev" <sdf@fomichev.me>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 <bpf@vger.kernel.org>, "Jiri Pirko" <jiri@resnulli.us>, "Victor Nogueira"
 <victor@mojatatu.com>, "Sashiko" <sashiko-bot@kernel.org>
In-Reply-To: <CORE-9NOG.v4.r0.20261116135311-4@mojatatu.com>
References: <CORE-9NOG.v4.r0.20261116135311@mojatatu.com> <CORE-9NOG.v4.r0.20261116135311-4@mojatatu.com>
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

On Mon, Nov 16, 2026 at 11:01 AM Jamal Hadi Salim <jhs@mojatatu.com> wrote:
> The release goes through skb_dst_drop_keep_metadata(), so encapsulation
> parameters a route carries are handed over to a metadata dst instead of
> being lost, and a metadata dst already on the packet is left in place. Both
> wrappers take their existing drop path when that copy cannot be allocated,
> so a packet is never sent with the stale route.

Just briefly looked at it. skb_dst_drop_keep_metadata() with kmalloc()
in the fast path is really no go.

Why not do something like this instead of patches 2, 3 and 4 ?

diff --git a/net/core/filter.c b/net/core/filter.c
index 946b07a..13f2d57 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -2470,6 +2470,10 @@ static int __bpf_redirect_neigh(struct sk_buff *skb, struct net_device *dev,
 	skb_unset_mac_header(skb);
 	skb_reset_network_header(skb);

+	/* The route is for the old skb->dev. Keep the tunnel key. */
+	if (skb_valid_dst(skb))
+		skb_dst_drop(skb);
+
 	if (skb->protocol == htons(ETH_P_IP))
 		return __bpf_redirect_neigh_v4(skb, dev, nh);
 	else if (skb->protocol == htons(ETH_P_IPV6))
diff --git a/net/netfilter/nft_fwd_netdev.c b/net/netfilter/nft_fwd_netdev.c
index 7447da9..d1ac4eb 100644
--- a/net/netfilter/nft_fwd_netdev.c
+++ b/net/netfilter/nft_fwd_netdev.c
@@ -15,6 +15,7 @@
 #include <net/netfilter/nf_tables_offload.h>
 #include <net/netfilter/nf_dup_netdev.h>
 #include <net/netfilter/nf_recursion.h>
+#include <net/dst_metadata.h>
 #include <net/neighbour.h>
 #include <net/ip.h>

@@ -176,6 +177,9 @@ static void nft_fwd_neigh_eval(const struct nft_expr *expr,
 		}
 	}

+	/* The route is for the old skb->dev. Keep the tunnel template. */
+	if (skb_valid_dst(skb))
+		skb_dst_drop(skb);
 	skb->dev = dev;
 	skb_clear_tstamp(skb);


pw-bot: cr
