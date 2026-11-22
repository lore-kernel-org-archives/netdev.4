Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795383289;
	b=BqmXojz/aS2TO44ijJHzh5dbE6wP/+cJTkVLCT+XTqpmPZPcn8HH79D7l7orxRdQbh4t
	 NlCws00jLjmZu/nh04lC9h2QC7x5jPLwLyxbgs811DLajpzcMAYx1xaHLfjBsBaKP/8AA
	 xayBL9lkftRFs9SZaUifBb7HkW1VRQMXTymUm9FVJu+EdHt/h32yoOQ2NHjQQVp5sXVq3
	 BDpkUQwE9MWZpQXLnA5Qkwa9Aq7duj11pwamOh8EEqK7IkmhYUi1eMLE7QDdtDMwOWE1E
	 he70hU03SQZ5gHKCo93ah3M7QG71MaO125SmvSQjitYZVZ4Ru6NAQy6B3f05Vn7dDWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795383289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XPYrCbu4T8TJmTKZRllmVp6cNeS8O7+5fQphOJsL0qY=;
	b=zWWx5hTf5BBwdOp5vWdZ/9aAYbyxzDwjVP8cQR+TZZqvro20+1HCGmhVCNEBsyGg3hfz
	 tGR3nnYLHkEL7U2XKp9SslpzIUSzi2vyut3oZV6rUvbWfWNB2nc9nmT1FvfZB9i3A6/r0
	 TTR/3e7MpmZW1M87q1ZJr+qu6CtvlAj6G+iMRpOyme87XRKH0UDU8NlXzUw15i781lFvp
	 jE6WbwW8nm/ABTUCXEuPstUIGvbJ2xMveRiz6sv6eJr7zo/tccD2fGhdhqVoRVNcPhAiR
	 bglahR7KzO+xANxSk6jImYFg5YbENiEPIVKx3j4CAA6T7Hy5MP5go1ER17QSi2cdV5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L48SGs+q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975E8606A31D
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 21:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 975E8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L48SGs+q
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f052ae3c86so11700855ad.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 13:34:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795383288; cv=none;
        d=google.com; s=arc-20260327;
        b=kDdvi/bd9AyF21rxVOHl5hoo0yg4+HMLQhyTA2AJPpHeWBIGjA7gsXbPAvcIXa6DRi
         NLVZ3pBXjM3GH+TQdKsR/BPLLwrKpr6CIZGdLBkmLFfET1ZJay/u2TKNg3rVCjttNSjD
         JYeiyMu5DvKr+SHm5Xos7DVgz7HMzRpi608jFynm0BP0Lp40G7xe+eeZPj2IcoJNvn0d
         NZYZj155JU/G6Jkjnx+UMx03WyMX63SneiGFUcKGZqXVF6yPzS1OLt0jE05JAC7g1l8Y
         6UCOHFqIPoSobJZyjxQhpSS9/xs2m74YMHnP4AYP5KJjSsm1bgcCH2ojdsp4+A/4CKXu
         MWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XPYrCbu4T8TJmTKZRllmVp6cNeS8O7+5fQphOJsL0qY=;
        fh=ebsnAGlaInK5zyF8SHT3VpUyef1kpwqVv0wxbgJHXbs=;
        b=nT7XLYe1RSr5uMZ1PAyyHpSh4V9S42SBEeZe2mYM6p8ZApNs1LdO3/KF6vKmsZmysK
         6nnyzLd0eJ0sKYZkdkm94Cu5u4rP1VtmgX3vnipRb03NoXj4YdpsmmiqCqm/x/QyrWuK
         LolGHts/Tb5iS9bz57FDDFb9wF+l/mu7t9ehw0OH7pz36uG/n9s8/k1RWH70WhmKUbiX
         ahQ+XlOOXC3Vu0pE83iSIO2bEtb3oOP9HEUqgS3J1O0/IopVl8qH4FixfSX3lRscZAaC
         HbjuPNyaToH8KmrhOcjX7UYUGpR40t4ShdEjRESy6J9M9QXmrPJBy1hK/iFIwVY4wlSl
         q09Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795383288; x=1795988088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XPYrCbu4T8TJmTKZRllmVp6cNeS8O7+5fQphOJsL0qY=;
        b=L48SGs+qITSiU9hSWY4o9yQj/aAnGU6HZ93xE0Olg0EWUzUN6CvNjvrp5INE026cGL
         m5+b38kIjvEV2FS5GipiC9A5XaQ1sQcUh1JC6pv7PmVZOtknNfL4ut0ivMegw4yoKYII
         ODqiQseoTD6yv+FbbokDjsVdRvfZAFx+EYFUKaSKT4tLNLy6GJi3CSAHO+pj+8DBcNnk
         g3MlHrBmg1XIsQyJYOtVqFnT5RX6vev9FXIR4wIYG5EMU/jYpc2f3/yntxpvfPHIfY9M
         n3R5Ww8jncIYH1BR6AQwQc/6TnbXSniQDHGBGeKXtVhZuR9CufKnHMncu8IE2i7y/okQ
         IZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795383288; x=1795988088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPYrCbu4T8TJmTKZRllmVp6cNeS8O7+5fQphOJsL0qY=;
        b=cPDWp2rtcMsDJGmdD2YO3bv0P/lgFraMhEIHifsDRJmKePEhJlw9GKwiJTBlxNnVfJ
         Db01RH16T1PYmwsm4dEAy5URv+UwTxp2P/tuiBxZnLvW3zAJdYyKNp2w/78Kg+zdjchQ
         KhO/TddQQHF753Ts53tfCGCWhCITGn+7/Hh4PNWBqWnVT5nUOefKU1Kj+Br7xiMbEQ3S
         /zErLzHKfGwQvHh++7fRxgVcYg7RZ3eTW6q/R0JUOP9Tq35X2GCUx9jIjqy27y3nose5
         YH6VHcE/km5pMk4fZWmop1Bj3VCD4crKGXg4lehaR1Lk1Nwo7eBQoiY97c8+NlJ+3Rvi
         tKjA==
X-Forwarded-Encrypted: i=1; AL+hErE4ZkGp7KPb7vcgtl6wZArujI7TiIaCSrKXQrLKpDTzzwgO+YFcB7BdcZuLMC9dx95m1dXJSxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NOLpfyFQyzccSvkyjS99qHWbsWEeMoHmU/TglQxNVKb8w4QDp
	X5zaXoyAKkU5oroIdSP3bVkjxPwltsiaJ/3tBvVVG9PsdxCYlOH1Ur7LHTFJ1SCUbnmaUf5QsPH
	ug/k8j8guFZVDIN6Ej2ZFRzX0t7DVcGU=
X-Gm-Gg: AZFdTZd39BPlTKynI6wbwonIcXrtU5BUXG3Zbsqu/NdSfy6AskN6wwZLNDXC2BnygmQ
	PS6Los0Yxh2XqobBxoJ++qvIVw+wNYkQZOFmFnsX1Wfke8hveM4lAc/xUoY31NrTm4RwAXNeWxs
	NxIcL0rhOXhvsRD9lVl5V65I/ElQuFcL6OWZ2ELjakVpl7Mxb/N3hbOU3+3m5iWKYukuf4JL8fq
	f+ra40bTSB40S3lqjnllDIn+ROuKESlu6lkMsMkfJzvbjnesFo8D9ZyD73mimzQ5r99OJjELrzb
	lKQpN63zIaYp9XpjNYsQGIX8ELFPyuY6ZsqSQuvaeRhFq3D8hRyMSkybBOiuLrFEhgfc9AvwqZW
	7jTY2cEnh95LIwhTbUZlbl0s5M4OxNeGJUToYHlrJ67j72l0x0YqPipo10CT2Z2N1MY2Rnw==
X-Received: by 2002:a17:903:298c:b0:2ef:d952:4a65 with SMTP id
 d9443c01a7336-2f03f1babeamr91216115ad.43.1795383287859; Sun, 22 Nov 2026
 13:34:47 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <MA0PR01MB921746F36D90C7080287ACC9FD782@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
 <9d8cdde77beedce76aaaa1c5a7a788dc@tipi-net.de> <CAH5Ym4h8-1mc+DX0Si7XROeGn9M72bQC+ooM05Y7ZmgTo+ON4w@mail.gmail.com>
 <CAH5Ym4jkX_tD58Gtd-mzruB+hqHK7s_9knNWh+gMqUjwuYyVPA@mail.gmail.com> <3303844cdf7c00c5369453eb91027c1b@tipi-net.de>
In-Reply-To: <3303844cdf7c00c5369453eb91027c1b@tipi-net.de>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sun, 22 Nov 2026 13:34:35 -0800
X-Gm-Features: Aa3M54ojoA-gtiCq3dXKw6zioYXOKf9vTAqllY425ytZiRU_L22WV3K8LaUJ9aM
Message-ID: <CAH5Ym4ijMNSAWZ8k3GmwOoLDBVTy32B1uhS_fE-dGhsPkgozeQ@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: retry a failed RX refill from a timer
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Anandu Padinhare <Anandu.Padinhare@electrifex.com>, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, David Wu <david.wu@rock-chips.com>, 
	stable@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 1:09=E2=80=AFPM Nicolai Buchwitz <nb@tipi-net.de> w=
rote:
>
> Hi Sam
>
> On 22.11.2026 22:02, Sam Edwards wrote:
>
> > [...]
>
> >> Do you mean "first as well" or "first instead"? Because "instead" can
> >> cause avoidable packet loss:
> >> 1) Initially, network is idle and ring is full of empty DMA buffers
> >> 2) A burst of exactly one ring's worth of packets arrives
> >> 3) The RX irq fires and stmmac_rx() attempts its refill-first (none
> >> needed) then depletes the ring to the maximally-dirty state; the
> >> refill timer is armed
> >
> > Thinking about it more: the "unreachable packet" problem happens at
> > this point too, even with the "first as well" behavior.
> >
> > Maybe the best way to resolve it is to adopt stmmac_rx_zc()'s behavior
> > of refilling during the loop?
> >
>
> Only if the ring is no bigger than the NAPI budget, right?

Right, but as pointed out in b6cb4541853c7 ("net: stmmac: avoid rx
queue overrun" -- the commit that introduced the "leave one behind"
behavior) the ring can be as small as 64 and that commit's author was
seeing budgets larger than that.

Perhaps NAPI should only be told to stop polling if we either:
a) Reach the clean tail of the ring (so we *know* there are no further
packets for us)
b) Run out of memory and have to arm the retry timer

Thoughts?

Sam

>
> Otherwise tne poll can't empty it unless a refill failed, and refill
> first
> covers that.
>
> Refill in the loop sounds good, but this would be IMHO a net-next
> follow-up.
>
> > [...]
>
> Regards
> Nicolai
