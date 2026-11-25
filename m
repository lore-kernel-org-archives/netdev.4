Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795601006;
	b=A0Ilpr0KbYL1hvxIuXLxUdLcOWdqqJ1C5NCJA6g9TUWmwWu23sXrIFTBZpqzRr/k/jYa
	 nAoOCyET8iKy8apPFwm/OJMauXAp2RJr/7OsBKI1ZsJkA6Y9lvbrtGLXMcwxVfpcNj984
	 1l7b2m1HSLsXzELqlIycvmMbJXpSmyQ6iqo0G5siaZPKYR3XOso90SWu7sGVV1pMgCUU1
	 xzQUUhYfJ5SP6HpcasdK4m7fTRb5E8elbk9ckvQcDg0n6PvUgMQO4FDvivWc75AInp2uU
	 OJOoG0e+DL+lUIsvsB7fNYEn49Dkmr3XTvwtfIjrpxp8uRnCFUfazWWGwSUGcxOFA/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4yqmOnJX29DOBy6vmcdiSt8m4vhrVknvos21mrTZvSw=;
	b=x0APbnfHC8Jx1q6V1e6zoSl2GiewKrouLcRyLdnnvA1d1BvIY/NYYlUBtM/vMvhWsnc9
	 zFiMF+1SrDSte9vQiNqLqE7plbBVgpyEN1e9DmkalXJN+c5cSoH1DV8YKC7yKvysRWrxF
	 fUWiSU9xePsxazyfFYT7FWrmsxDHl4AOmswGS6Cg7slT/JIyhX0vU9jDEwb3qq9u7UEFP
	 80o5fkR/zt/u/xaF1L0hdg00pgLwbeb1v9D+hOcFDBsLBxjoEa6pXs/qizv44RO3z0pRU
	 79BFLgffRZEnozHJNrdTAYOSwUzokD6dMmcYDo0BrKvgQ01CpieXvy02Bbvpr/jsmjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ay9+Ssce;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26400606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26400606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ay9+Ssce
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae25c846edso37527051fa.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:03:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795601004; cv=none;
        d=google.com; s=arc-20260327;
        b=MYMmeUZCIF4Emh8VHIpngou2OK+2oWG5MgJa0I8Hv5gxu3FYliHUVdlL9Ky7Hcn14e
         m/miaQAAWPAsoo2EVCp7pLopPcWc4yHdPWXa8ZpiOG+sAlf0GG1m5R5s+vYSpJaoJPDq
         ErGuY3dLO2Km7rpKQTaPX5J1YMRkamXgMsNlps17u4r7SahdrlB+pKusBYv3yASSePdO
         BQ9FJK1MT/i5BmdAKAMYOvaiyR/rzQXvDIFczxPYLzPdPRyxp6x6wKumxTX4TM16f/mS
         SoNWozrqqjRQRlpo4669SmUL03fiKGmHh75PES/l+97OjqeBDErV9Nph5xu/WSS+VSey
         4sfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4yqmOnJX29DOBy6vmcdiSt8m4vhrVknvos21mrTZvSw=;
        fh=3ZrN9qEJTOxDusgjqaLto+uUHB1yxC7luzj56OurZO4=;
        b=fWRCUI4bGBX/1/elhYBY0jjU/1tBqeOv4lB4MsI/BsqLO9/I6Lkz6r0wac+q3+XFrT
         VXekJv75F/uK/bZt+rzzebsIEAmLYyws4U/nA90Cry2g08SuewabdgM5/MlupRV5WdjU
         R/husVmffh9gSF+NxkP9olGfCCayzGYG2eMuhNU0NJ/XzBTDLr2xWzgNbAaTHIz2YCkH
         +OoXJP6vNSep79VqnZQ2JoBqTguTH/7RI4Jp6iCTV1MyZSlC7y5ZmfSXZlmGJxMl03EE
         ktynzM6gv1sJ0Cp8+nCivB0UG4hhZrCSUF9zIKpsaXjDfWDRL/XkdWAtOxCOMkCf52it
         /0jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795601004; x=1796205804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4yqmOnJX29DOBy6vmcdiSt8m4vhrVknvos21mrTZvSw=;
        b=ay9+SsceQ9jHRcRMslrgmqdSOnvnudmMflbs1Avejl0zkOGZBGKpQA0dM6CYQutGwW
         9u/N0BGvFt06XERIVFzmv4f8jyisegG59kaO0/P/YagT9iWpfEJl3Wf045T5K5BD0Wqj
         cN+C1EROJW8WQY6Cp0ymeeN5pYoJaLNeCZX51EE0u5xJn7ueHxNNF+nAIR0PU/I5JwVU
         NOfZiH71ylqVnQzKUTYh137Au31crg7ZjGvYhf3PprVQE1EgZuXk2WwnUJdmY1e5WSYH
         EfQWhIwdnuBi26YrBLsUTA0hislhvKWy11bUZD1WXBQXYCxf5Nww4/Mu0LX3sbnOistz
         FpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601004; x=1796205804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yqmOnJX29DOBy6vmcdiSt8m4vhrVknvos21mrTZvSw=;
        b=FdNm38AIWdsz3uw6JfJBJ5HZP0KDa6cG7DyevIcA8gsUbHc4ZTx4mxW9fLJRyf8qWz
         dsoZaPbmanOpGXkN1o7LvJA8g+54wLMXxX2l5jJ2ASI4TNj9gCGJSjsTOeSBX7AqFSYX
         IfqqEaZhvWAPH0i9mMvbztH8aLeVyeeMsCaZEhOuYtFea1hzDYaAOT6i6C6o4pqC2xYe
         /vtbnIgbULUYZDMukQiHEQDT1LiTVtVpOCF3pGe0xl+P9WZEaCB0sDE+Tf4DRo4JLECQ
         CX9VI832v1D82n0WYNzdN2KpV2J04iExSpTSHDd0ZxFJP5eUcczMMqwDgfE68JclwnTZ
         7Wmg==
X-Forwarded-Encrypted: i=1; AL+hErEBS5v+xqTWth7OnIn4+3dU1vzgtLgxbpa3kdii5flfw6yP1M8cadn3va9kZUvDbj30JzK83KI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vhgRIgCdFJdUbxfyUdAqOLfLxOS223Z7INJnq5RG74e4NnHz9
	rVIGRJZo/PqhYNK2IPNdwHnuvDm3htt5j/LkwjKQF7WTuC8sgZPTI85fcWtMZuZYJ5+LIEmnLC5
	AMuBHE+/mJOSH9+pQZ13dVDPJsV+edDQ=
X-Gm-Gg: AZFdTZeh+UqnMHXvcrcknhK+BVpiEYiUcFM+NvXTFWmrNsYcmh/DZUDGykSnoZFrcbw
	6AV3Vn5gzEahVyN1ejbETw6yd6Oq28XODnqDM5ugUQK9rlxEguCTkMPRmHBROV8v/Uo4pYRipbO
	aob3m9HhMALAhOZggwLwpt5rk2Mch1UNFVmnOmd3EpukKniD5/cx0+0yM+TqO34wbcNnzPVrMGq
	LXfBtsvOD4elZp2arN1SyxX1n/Ae9U+Zmqu95Y/xUqSnaPQyBsiKmNM4nZOgN6PwuzHz/ztb2F7
	hkLM+36hcZO05pxmooS8/8j5A7IKaL4sgJKA6gUo8f6kZi0eVAqSXt0XtfWjEzXy1/kgN6esd6v
	Qt2J6UZuPJzUo5MUgBHmPqKdphZNzZegDNftKvw==
X-Received: by 2002:a05:6512:3e26:b0:5bf:dfb9:33db with SMTP id
 2adb3069b0e04-5c1bc894b28mr5679079e87.38.1795601004108; Wed, 25 Nov 2026
 02:03:24 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124230228.3868519-1-graypanda.inzag@gmail.com> <DN3TX43KWXO5.JWLJ9HO1C9K7@gmail.com>
In-Reply-To: <DN3TX43KWXO5.JWLJ9HO1C9K7@gmail.com>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Wed, 25 Nov 2026 19:03:12 +0900
X-Gm-Features: Aa3M54r5upvGV8Qfv_TsLuVCjrNe6583K5J-EQlsL_l6e_r1ayLjtruktTOLARY
Message-ID: <CAO7ntTSjpH337UucxpxSCTXud3yYi0MqfRELHFcER_enhu9fAg@mail.gmail.com>
Subject: Re: [PATCH net] tcp: avoid NULL skb dereference in zerocopy receive
 with sockmap
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review and for pointing out the other paths affected
by a stale copied_seq.

I agree that this should be fixed on the sockmap side. I will look into
e5c6de5fa025 later today and prepare a v2. In the meantime, if the
sockmap maintainers have a preferred approach in mind, please let me
know.

On Wed, Nov 25, 2026 at 8:28=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Nov 24, 2026 at 03:02 PM Junyoung Jang <graypanda.inzag@gmail.com=
> wrote:
> > Check tcp_recv_skb() before using its result in both paths. Also stop
> > before advancing beyond the last skb in sk_receive_queue. Neither
> > check consumes data in the sockmap ingress queue.
>
> This should be fixed on bpf side. Other readers trust copied_seq too:
>
>   reader                             with stale copied_seq
>   ---------------------------------  ----------------------------
>   tcp_recvmsg_locked()               WARN "TCP recvmsg seq # bug"
>   tcp_read_sock()                    frees new skbs
>   tcp_collapse()                     BUG_ON(offset < 0)
>   tls_strp_load_anchor_with_queue()  WARN_ON_ONCE(!first)
>
>
> pw-bot: cr
