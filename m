Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795357310;
	b=tAdjRUyZKunxXdfl4t3xWbU3pYbXb59MUzF1eGrZTn19mJEUjp96YafiPQnXqTafyPoD
	 jL8eQ04TweXCK7Yx90WtAwlFuCShft2FUNSAR4nGaP56QG0cLS9FCVJ46ng0EJrPuRXrY
	 PzQERbMrDCH4Dn6x4xRtSN3wFrsvkch6STS2lFw4GqPIyinwoMjLNbv18rCuijJaMMLZl
	 SiEXtCXxldscq1ekf4ai+6yckpPr37Bq7iZRS9CHxldQSu8bpP4s4sw8vftkCzXMdAHZW
	 u9VNgutOV1Vn3u5AoGIh5PO61uMkXx85mANeGT1PG2XgMDH5hI97Yk8YPCY4J8zGRGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795357310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yPwxyZPCJRkoA2qMW2RTyJ99dfsqAAIzG4plyK1oUEo=;
	b=v+UEcZSQvaYIxVT+JRNkudJq3e+KtiqzRN6O/lHlczpMlQJ/N1zQ5FKuUoR3Y80lZo3l
	 YtTqyB3BxMjDub5pPLMBeY4UKD2IM2OA1wOZzTN063C3SIY8y0BiKy9CgEz3GQ/OtldNY
	 xekto5Y4wCDk9SnezExykRza911nS+U/ZEukX/dCMZKaK9t4ljcb5yZYm6E8UB/488DFO
	 0wlyoGuSwvvQob2buP8rbc7+svdjmsWf3Smv2o+PrbUme6C5V7ECysQ0uzfVYtQvzzvDe
	 6qOnlK5AQks9fykJd8+vO94kDmzpGwQrnfrK6gkMkbXA6Age5UJwJ4XNKf8tVCXKpeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=Kg+AEzwj;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCA0606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 14:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DCA0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=Kg+AEzwj
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso18342335e9.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 06:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795357308; x=1795962108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPwxyZPCJRkoA2qMW2RTyJ99dfsqAAIzG4plyK1oUEo=;
        b=Kg+AEzwji6EMm0ZnkcmjqMVQO8GFnoZn6i7E2sQ89lOeGDHc1YWGlGV3F72W3WM4Gt
         ApWbvgBoIylVhyIGF22uEt0eTSveyHEmOEHBnQpw5yYfee5WAUmj8tDFvUhf01v/vlzh
         bOxiFpsaHIdxx7PTIWsrDvxbnI59ISQjE/8WdfBKcmQg6m/LNIVKS6scrwA0eKM5/NlS
         xootH3O54xz30xCDBRGh/3BImi/22PVXThG27C7QycZ2MhsbKNb2OML0MiJNVoc+IeV+
         iskAIN6YYAegACi6rsY7/8/4CyZHQE2Vst8QLtX4GQStVeUgpl3QkKow9gxUFKUob9x6
         iETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795357308; x=1795962108;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPwxyZPCJRkoA2qMW2RTyJ99dfsqAAIzG4plyK1oUEo=;
        b=G67JgqwgzehPSi788ZOpdPZznToel9klJM9MPkKOxBQK4+k9I6lUCItjtJclWILvKr
         LWLrYpySfwqCnwGmDYgxALnS8UnEVJmVns5nOxZNbUfXspE8WCiMzibux2qdWAwB9vCv
         Zd9vRk5S70WVncKxk0qLU+2hazOtD48IbnkpC/Zcv6hR+9yDSUIzWCdE0OHwo08ctuWc
         YhPYDERmjp4+CgmppsRiJCmIV6BnlBjRU1nHacuQEpxHN4p/0Jp2mdu6nuh7MhqN2ELm
         /X4dQESi9XguoYZIR/mpjQjPCC/CDGGaWapwmfrQQQekw+pKrhRl4192jpoTzGuhbyVz
         eliA==
X-Gm-Message-State: APuU4Z/FxpjEMqw5w0yOPCEHg0rzrmLCuJ/GBtXskXGpJaluzlnND+vs
	R8wqrVarHKn/zrNZfUt1UhnT8cUDBS+baa5TmOPSBj0fKrsJMtLfqzkEuAIOjzW51i8a9AAc/3r
	DNAVr8p9yWQ==
X-Gm-Gg: AZFdTZcPKA/pN32/aC/H7+q20FBGD45WPUU/qxN6tsaYBJFsvqBzNxbyBDgrsqgW6wC
	O8hmM1+FPecmBTfMFEs2Lah0xjqny92VZygD/eh5Y9VWIZmLjXK/3SH3n2WEB6wV+z2jz/dMolc
	/S4RtJf8zCouxJUmV9/FUBnxT64089BDLW0iHAonbCsvU9kzptYnVJ2hsf2aRHH7r/yFE5rbB1i
	+y88aoaVBr8zHdUAWXTM6issylcSRUeMiRn7OnX9lMLgTBy1aXUFxnQM2rNvxmKhhaXsY40mjzj
	kKjvCUATFpb5duuWmQkniawnN0T1/aH2vwijFOREUMbJq6nob7bnQh+cYNmyWy0Bu06wi+XmitZ
	GnBcxpYCRxi2J/ujuCaPGFjq3yShrTdTw7aZvKy44vOqaprAjCi6tfRHRr7WcdGiKjwfU3pAoGe
	78MGCeZiLHs4zcEKIW2a0HtUMWI4A2qI2pW1Y2sF1NUd3kLdagsUZoBgQ0VvojeqtBoUb+dq9C5
	OhOu+oT8CeKJ8haNsKLQ1Dov8HpGdBpMrgzkPVCkK39PZU2UCDYTaqsFf06Qyj2HZHq/9HlRx+m
	csc1Ax/yJYfvdfgwqyvq0H9WAoLAlXx8QfpKPqgCauomCiEijsndnNImxAA=
X-Received: by 2002:a05:600d:6510:10b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb8881de57mr123249665e9.26.1795357307361;
        Sun, 22 Nov 2026 06:21:47 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm109767805e9.3.2026.11.22.06.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 06:21:46 -0800 (PST)
Message-ID: <c953972c-dc7e-4b97-b271-5137f0cb2cbc@blackwall.org>
Date: Sun, 22 Nov 2026 16:21:45 +0200
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: keep skbs with a prefetched socket out of
 gro_cells gro
Content-Language: en-US, bg
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Joe Stringer <joe@wand.net.nz>, Daniel Borkmann <daniel@iogearbox.net>,
 bpf@vger.kernel.org
References: <20261121160204.4024204-1-razor@blackwall.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261121160204.4024204-1-razor@blackwall.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2026 18:02, Nikolay Aleksandrov wrote:
> bpf_sk_assign at tc ingress holds a reference on a socket that is not
> rcu freed, such as an established tcp socket, until the receive path
> steals it. ip_rcv_core keeps a prefetched socket so when the assigned
> packet is an ipip, gre or esp packet the socket stays attached after
> decap and their rx paths pass the skb to gro_cells_receive. GRO merges
> skbs with the same skb->sk into one flow and clears skb->sk and
> skb->destructor of each merged skb without calling the destructor so
> every merged skb leaks a socket ref.
> 
> Send skbs with a prefetched socket to netif_rx instead as
> gro_cells_receive already does for cloned skbs, where each skb is
> consumed on its own and no reference is lost.
> 
> skb_sk_is_prefetched tests skb->destructor which shares a cache line
> with skb->cloned that is read just before so the common case adds a single
> cheap test.
> 
> Reproduced with a tcx ingress program on a veth in a receiver netns with
> an ipip tunnel which assigns an established tcp socket to ipip packets.
> The sender sends 32 tcp segments of one flow inside ipip through a netem
> slot qdisc so they are decapsulated in one batch and merged by gro.
> Then the socket is closed and the receiver netns is deleted. The leaked
> socket holds a ref on the netns so it is never torn down and its devices
> are never unregistered:
> 
> Before:
>    bpf_sk_assign() calls 32, sk_refcnt 32 after the burst
>    receiver netns deleted, 30s later its veth peer still exists
> 
> After:
>    bpf_sk_assign() calls 32, sk_refcnt 1 after the burst
>    receiver netns deleted, its veth peer is gone
> 
> The problem was found during reviews of patches that add bpf_sk_assign
> egress support.
> 
> Fixes: cf7fbe660f2d ("bpf: Add socket assign support")
> Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
> ---
> CC: David S. Miller <davem@davemloft.net>
> CC: Eric Dumazet <edumazet@kernel.org>
> CC: Jakub Kicinski <kuba@kernel.org>
> CC: Paolo Abeni <pabeni@redhat.com>
> CC: Simon Horman <horms@kernel.org>
> CC: Alexei Starovoitov <ast@kernel.org>
> CC: Martin KaFai Lau <kafai@fb.com>
> CC: Joe Stringer <joe@wand.net.nz>
> CC: Daniel Borkmann <daniel@iogearbox.net>
> CC: bpf@vger.kernel.org
> 
>   net/core/gro_cells.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 

TBH it can be applied to next, this is an old problem ("never worked") that is
a corner case found by LLM reviews of a patch-set, which would make it easier to
reach. I've tested it with net-next as well.

Cheers,
  Nik

