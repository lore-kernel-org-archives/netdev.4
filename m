Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795481404;
	b=v1GLjeIK9N6fiafQcnG3RsDT7ONV14csavSBTAAaD2pdLP/mxh/GeKGkhrnTQF7VbXTY
	 N6jr34zkUJqbccqPTDxfKSQXH3gmiVq6NCeEGAPkk8C1f+RsLQLA+zhpPY40LR62sI641
	 2hgu6+eeNnBSLxjncSIrJ86kauYODpy9nssS8Hl7E0aAi5DGsV287OyEIZoBH1dK1+6zI
	 ZyK55cNQiTBE7Kwu+44zTaUzY9E+01HDX8J7VvCySPqjxvR+h4mGcs18sANoiE7tPLVlj
	 akj3fdxJ+R+Ljmx5gpNs9bGYRb4Z30wHtcjihIioTvx+wKkLw2bQrB/vBnU7zBd92HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x9kUAepGBbeAQ7xZn4vVXrHAL1ydgs2XIrst0ZtJSm0=;
	b=ZwvXqYe+IpNIpFQaplRrQRXsrUYn2xPha3kqxhTF0mB8wrxLsRU8vjrOa1Jr4hJCU26h
	 eGv1REMIxMGR5mx071JB8K0PTFA2gFvokKC6khRup7thBSqUMg+8Ce5bBdtinhhd1X6z4
	 gu9Qse3chRmxvELTO91YpWcx7MqcOtRhTYaF34AdcqdcgDCUKYsj32NGp8UuGbppMOhmi
	 bi3R0PnYfmK0kyxWTVooAzvIY3IKzwomIb4dAtBkZpFZ85Xggq+IG2VicEfmkTYnWwjWF
	 p4dB2NzepU9nVY/pzLHzm02GEPOENwuJoDN6d+G/VC4P/eTAzvLaquptQcllTmdVUfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=LFfW3fUy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA52606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA52606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=LFfW3fUy
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b271e573adso1638265b3a.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:50:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795481403; cv=none;
        d=google.com; s=arc-20260327;
        b=BwepRip+bpJrOzdMNj7EBqHEIQdDmAm0Bx+ZRTzX42lftKKfc0vFsXGKP1o95RW61l
         zNMMUAvxsF3TFnul+eO8yDpejYu2VZeqLPiWWEsFohVQkSxiRdAmdyeBhSd6YWCk250m
         EpIEVLGahN+rxzjSV6WX5v0AYZRnLwb1EE36oLyhCK+K0wTxDKI4iitBqbdiJSa3ggs0
         gtHRtwN/N08NNjxcq6n2PRj7cg+1Eg57vL+kcyL1WM1eoUnAC6MQB58qKPadPMGrixuO
         0klaUijlJnsQbDMhmyfSQS78l9TurwzYJSpNimEj2In5EnK1Vkg7q4+LWiJC2vTGt29v
         hoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x9kUAepGBbeAQ7xZn4vVXrHAL1ydgs2XIrst0ZtJSm0=;
        fh=8Wf85pb1kJ87n/waqci3IKE8NrH4e5WzohQHHn0JaC0=;
        b=rwnCYNlz90QoMnnXGuP3BaiGvkqydGhlW44BjG0ocCCnmaPWWA9tzCW/XFYiZdez6S
         bDpGhIaZl0egIem0Jq3plgIYyYOLjczr8rZJej1/3yIHhZF7BXxXxB+IskQyh1NWpHgJ
         M9FhOo8cWevChWn/m8pE9B0ZyRZk/dposF5aAYoO2EgPaQ17sFkesUE6ikj0R/QgOJp1
         LOKGFLC3nWyG++bhYWkQtqnjWe4bZIcHcvghsSyGBiTxuk0dlI6m2F8WMJaMnTrIXl/b
         EAeInS1qeyfYBzbrWymXub5R7hb8lPgf45CUs6SjrD2bKeP+I5+I5+OwQOCdpqZxT6Ai
         rx6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795481403; x=1796086203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x9kUAepGBbeAQ7xZn4vVXrHAL1ydgs2XIrst0ZtJSm0=;
        b=LFfW3fUyLGEm+PuTmapUxE2fTboIfl2wfeQbetYNjq7luZwIbeSCTw0ToY8I4+IjzG
         9E4tvoAMG4fu56IGiKM7BWrktD3Lty5wetz6ulLCC7nRkY2TzJk2qNh9aLf+gm4H6pUE
         KpaYq3mljvH08etI3xyMTYUDwQC/0S+c0Ijks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481403; x=1796086203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9kUAepGBbeAQ7xZn4vVXrHAL1ydgs2XIrst0ZtJSm0=;
        b=WIzfAMvS4G77BTyrsO6pibqEJS80/mkI0o/c5sG7y3bpXas69xOQqIjhfi1sPPbZR4
         ruu929yeHsNf4VK/zaL+il+DBT4IAh0u1js31tb53UdcKXykIPNc9HPZrya7I2oTJvHJ
         XZWMBGFSjiquWLBQLi4i4nzMBGHRLql3tx/pUew7cNiqe4XT3P6psLlfMzM4jMYgN8ni
         THp6rfN4aCqaUliqOzurMw+lsZGp5jhv1oEnct1ZsyiEkAWXKNsK//o1oZNOBoIKLs8n
         1gqXmQ9sMRKtCfdZRvKDrjxldDly/1JI0ptz7g8wDIRV1HOyW76yyXoMSv31tY29pA9B
         RNpQ==
X-Forwarded-Encrypted: i=1; AL+hErG7su0LInrixCaIiHKwjy+Lv++LNvNZ8QbzKYCR/Xuxl0UnD8mVO6WvnwKA1zvAe1CJp23Va4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NcItJiNW2Vl9UdP1bbJNqVyntzYad065Jk9IcAZeRDbZpO1tI
	7gK0JS8CMU70CMZGpIUcUnPLB6mx6EmZGaiPX4CC5OP/8Y5UfPgu8T+7QV6kzazEktiT2boz4eh
	qd1zEZQbQZVzCceJQEa/Ou4b63UFpCU8WVAKSgOb+
X-Gm-Gg: AZFdTZcpisnNlDBKqc3r8GaBKpzwjGwUA9e1hU/r9QCvpUIMYOdj/4lUqFr2GbhYVEp
	zipw2XQbRMxcxLmM4fki6TGT6nsZCpOK++uX9kMqmX7nXchyuvMl0hudoFhQtVz/hBW13bSeuy9
	6necvGN5qXlVFaaixqLBYJpou4JlAkAey3pJgHExumnT9KJrbltSQULfWazy6nvFit0kgQqzZEr
	DkKCoFhnuBferpwreL6BAtSOr91zuQ+TChG1sdDwGs2TkItpQEYfjBGoHpSu6T/CFZxxwmcB9i9
	o30/1Fi4sHGaynx7GP/TI407hdCfSOtMWOGoh4T8WnlZJYLrup9nUwLPnl1XjpXW3OvspUmg8IE
	ijBIddIQ8tPzy0Nb3FN49F+pmAMxSCQHztRborCOZr9VGsxDMIqpBlQwnfpkPMgQhGbd7v7hEss
	lqnXoL4Ybv+eEn4A8=
X-Received: by 2002:a05:6a00:a02:b0:89f:600b:610d with SMTP id
 d2e1a72fcca58-8c87c38b26bmr11870717b3a.31.1795481402862; Mon, 23 Nov 2026
 16:50:02 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123184602.386372-1-edumazet@kernel.org>
In-Reply-To: <20261123184602.386372-1-edumazet@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Mon, 23 Nov 2026 19:49:51 -0500
X-Gm-Features: Aa3M54raxGP7O5s40teBy9r-vnPPy_MbNGIAqzjaGfn2plJrtgC6vUrgA45CaK4
Message-ID: <CAM0EoM=cZa-dzO1zkdNRV+fuzYYgJtC7C2WxijAE2dtPdFW5GA@mail.gmail.com>
Subject: Re: [PATCH net] net/sched: fq_pie: clear memory_usage and flow
 backlog in fq_pie_reset()
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:46=E2=80=AFPM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> fq_pie_reset() frees all queued packets but does not update
> q->memory_usage, which is only decremented in fq_pie_qdisc_dequeue().
>
> After each reset of a non-empty qdisc (dev_deactivate(), parent purge),
> the memory_usage reported in tc statistics is too high, and once it
> exceeds memory_limit the overmemory counter is incremented for every
> enqueued packet.
>
> Clear q->memory_usage like fq_codel_reset() does.
>
> Also clear flow->backlog, as fq_pie_timer() keeps feeding it to
> pie_calculate_probability() for flows that no longer hold packets.
>
> Found by code inspection (AI review) while looking at an unrelated
> syzbot KCSAN report in fq_pie_reset(), not reproduced.
>
> Fixes: ec97ecf1ebe4 ("net: sched: add Flow Queue PIE packet scheduler")
> Cc: Jamal Hadi Salim <jhs@mojatatu.com>
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal


> ---
>  net/sched/sch_fq_pie.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
> index 5982847df8f8..a5e2a83efb67 100644
> --- a/net/sched/sch_fq_pie.c
> +++ b/net/sched/sch_fq_pie.c
> @@ -547,10 +547,12 @@ static void fq_pie_reset(struct Qdisc *sch)
>                 /* Removes all packets from flow */
>                 rtnl_kfree_skbs(flow->head, flow->tail);
>                 flow->head =3D NULL;
> +               flow->backlog =3D 0;
>
>                 INIT_LIST_HEAD(&flow->flowchain);
>                 pie_vars_init(&flow->vars);
>         }
> +       q->memory_usage =3D 0;
>  }
>
>  static void fq_pie_destroy(struct Qdisc *sch)
> --
> 2.53.0
>
