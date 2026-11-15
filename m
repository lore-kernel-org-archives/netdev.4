Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785201;
	b=RBEIUNgwpGlis96vRYtIU8l20GwIuunNXCOMS7rCbjTYbzsx8yx7mTMa+uVq0ob4W9P6
	 M3sQYVDsHTmSyPBYpPNpb2NlE4oLZDvacEtRM8Iuc5rLlrvg/mVTsv3DcFZzPQYeS+Sxb
	 eSiLeczkm1Ytk+1Cj+O51o+RASu5i/q/waxKjQ323RK8I6HISz8eaehAouinUn4lEsT3n
	 hvz5f3JyeuD9QAL/GfELqVphPco31aKfi5DOpP55WNd7TEQOx3oAYvuEx7cKNFnBn4UT2
	 p/fQzDrgh15pPRKYDpI0y1w+rdKBfX9y46QugzpTFduIL/JFtKvMpLWIDDcTsJSrnNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=20xh83TZY5Uy9+3Rpue534EqUQXyz0SBbzg5tu3uVBA=;
	b=pRAMGyA4rExNgjsXLik2kH6L5iCI/X86GT+eRM4ygiIQEQNJf/7No3PEFI1TMSrI5nC3
	 OORL8d9DK4Fe94HcMoYOyXunUyhi/drcScOSkRfuwZOVlSP6riOWzh5rLUK0fL97e4aWs
	 QL1NAxI+6P3IkyC9JvB9CVIhU/eYzsXSl/sPCPl32BkmWOJCSeo9c21NQgKbWbseve3SV
	 IqmNzZWker2jTcrGNCRKaYJuZYgD0zgsH9HGmLgEOYp+PPNbMepYmIVj6i86bTVHqwyQk
	 iBS2W+a+1TRAQa64J6gn7w4hXgXTa/AaCuzyEOvvl0/LPDvN+x4OMO+fVMp3rmd4+wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gj10Swzo;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E34B606A329
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 23:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E34B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gj10Swzo
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cddff772fffso91378a12.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 15:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794785199; x=1795389999; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=20xh83TZY5Uy9+3Rpue534EqUQXyz0SBbzg5tu3uVBA=;
        b=gj10SwzoKMqoqx9yr7X2Fju4cNBju2Oqd5X0Ay4Y61hHfD7PCDp9yiFRZZggUUCphi
         EgquiXzLIx6aY4R2RTd5ZLyzF7a+dFyArlFGpwOF8hzIuQxpoF1rvqBPTA90bbQtiSc3
         ZX0RVckXRZHz0dFR0n/+vn5BPOC/cB4YcRGnL/oyILEIke66Jod48SG+Qv5PIZtk+cJ3
         a4jGk58g4rcuy6H/nHZi7pTcKmRSJIlcgRxeZ8a/8BRn14ucVJyS4iEkzUGGbVSfsTxE
         PA1L6L9cE4UDQma31GznSkYOnY4WfVQEo52nxdxOSnQrrOnmbWew4sNB0BE/xLjNWEuG
         NuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785199; x=1795389999;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20xh83TZY5Uy9+3Rpue534EqUQXyz0SBbzg5tu3uVBA=;
        b=IxyCkssBarpIuDEvXQHhb0gGXvzOPz4wAYqPY6y6GHpl/RFEpnq2TGqb8jRsgPo1jb
         M0AeYmWhU5EEaAP2w2UHk1k/nOA3gZpAP+Q+nMivYhDtLkvBfL+JyA8YP6UAUCPvZmU/
         OdLZYFMxq8yrkTuc+faf6elqMkpceG74wVuqiVvz8ovoWp0EC6nw4oxYlJEuV65mnyTc
         TP/1ZLH/sZVQYre6NepDoNTCE7qZdBFYvLzvJ3seDGVOyRSbHI4PNTablt14G1Z6f0aJ
         wrz/K8IaYaKpxHYrMxIdF9Rqi9U1mt0T9+Csm8DC9rG6UZyzRsoFJT38kR8bow3ukJEs
         U1wg==
X-Forwarded-Encrypted: i=1; AL+hErGckDi3bdNyWo/0BFPVecfRg+7FI8Fp/9z9wyJbOI1Q4Hj7bWyRrZ4kOVxglE3Eiqz3pUUytOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rtaf8wpaRGkN9L8scF3kN8kDQgu4zRmnYiqAdQ+eKntCsHmnh
	6uktD2btpnTwu9iKIU/4W97VobYReURXuikJhXN1ebxUFO3fVdhGVWCU
X-Gm-Gg: AYBFou1sPPCQVmUQPDXQNLS+tXaWz4Jl3o/3APY3l5aPvgFi1uyHxYC1jrgMHgQGmR2
	vmqNEj2/LfCMeqe8eSOtU3m4xerU8f0ibwcaxsJjteAw9adIEbSF1SxxI1saRoJA4DML3XHbN6n
	TxERs5U4/TmOimyccU3YquWO2eJVed178wJLLXWfZOZi7GE7U5uP+mrdxZonS59JEH8nBxisR/F
	D+gJnPDwm/H+R2wNt0GGQQhqWcRUpwoKyl4uAM2PFuVLpcURir3sOZ2Sj4TvsFi6Gl+kzXYbR8t
	JUJKUjXt3z9xyccEuWjeJPprsXKluELZi7JYkEteKeC5+HuIs1dx9pkINaUDUpmAZbGXGtucq+/
	IQsDyQRBYCS/sN/cWQTv8+/vwQORlajgupWcvfUO9eUTu1pmI/XvIOEZFzIGvXaQaXJLgfCeKFV
	jYu+sl5EiYx39ZywXQezI31NNwMdKa5ZUAUxgX1zQWTb+P7/OfoTIclahBGBtWeRwKipEqxUgiQ
	G4PtHmHjgswNqShfJorC5QgQw7NIKWhOnHFd8x5CPZmxsTPKiuVDOUML+oUInovRwdVv7llToU1
	rpwBo5b2/AwHTvDU4tinqJENtbi78LabMLpOjyCrrXwPOy/GUTNW3B41JZHS2N6c8CRbw2C0lD2
	4iXp1RtBx/TiX9KHjOrZUivy1KpC0sib3GQ==
X-Received: by 2002:a17:90b:2e06:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b1b07e1cd4mr8163612a91.6.1794785199420;
        Sun, 15 Nov 2026 15:26:39 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm6832094a91.4.2026.11.15.15.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 15:26:39 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Nov 2026 23:26:38 +0000
Message-Id: <DMW695ICRVGM.2YJJUJQ12T0V6@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf-next v3 0/8] bpf, sockmap: Restrict iter-context
 sockmap updates to sockmap iterators
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Michal Luczaj" <mhal@rbox.co>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Eric Dumazet"
 <edumazet@kernel.org>, "Kuniyuki Iwashima" <kuniyu@google.com>, "Paolo
 Abeni" <pabeni@redhat.com>, "Willem de Bruijn" <willemb@google.com>, "Jakub
 Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen" <jiayuan.chen@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Simon Horman" <horms@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Stanislav Fomichev" <sdf@fomichev.me>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
 <DMV5NLOEYFGF.C7ITHCRCNA7P@gmail.com>
 <e8f1736e-3f13-4f92-ad69-8b166c41e68a@rbox.co>
In-Reply-To: <e8f1736e-3f13-4f92-ad69-8b166c41e68a@rbox.co>

On Sun Nov 15, 2026 at 11:10 PM UTC, Michal Luczaj wrote:
> On 11/14/26 19:45, Alexei Starovoitov wrote:
>> On Sat Nov 7, 2026 at 5:58 PM UTC, Michal Luczaj wrote:
>>> Follow-up to Sashiko's report [1] and the decision to restrict which
>>> iterator may perform sockmap updates [2]. Series started short: remove
>>> about-to-be-stale test, restrict updates, add a negative test. Then it
>>> expanded: mark bpf_iter__sockmap::sk as PTR_TRUSTED, restrict
>>> bpf_sock_destroy() callers to iter/{tcp,udp}, few little tweaks.
>>>
>>> [1]: https://msgid.link/20260626205814.BAC3C1F000E9@smtp.kernel.org
>>> [2]: https://msgid.link/87echn2fhd.fsf@cloudflare.com
>>>
>>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>>> ---
>>> Changes in v3:
>>> - Drop RFC prefix
>>> - Update bpf_iter_reg::feature docs
>>> - Fix tcp_request_sock BTF build error
>>> - Restrict allowed callers of bpf_sock_destroy() to iter/{tcp,udp} (Ale=
xei)
>>> - Link to v2: https://patch.msgid.link/20261102-sockmap-update-limit-it=
er-v2-0-e96a63c43b39@rbox.co
>>=20
>> Sorry for the delay. Applied.
>
> No problem, thanks.
>
> To follow up on bpf_iter__unix::unix_sk, looks like there's a single help=
er
> that will become unusable from iter/unix (once plain-PTR_TO_BTF_ID is
> gone): bpf_get_socket_cookie(). PTR_TRUSTED then?

I have a patch that 'forks' bpf_get_socket_cookie() into two helpers.
One for trusted and one for untrusted.

Also have a patch set that removes legacy ptr_to_btf_id for good.
Hopefully will send today or tomorrow.

