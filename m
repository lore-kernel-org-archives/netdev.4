Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517579;
	b=UcFj38Ey32ylGiHH3CJMxxgHdoMwDtoGxPK2s2nlsVprebbiKsMFbQNQQFNJia2NqSFQ
	 7rr/8DV4UF3EJQATkcf5PvNrfXxVIH3+UdZ+8zaqXbUsDoZ59YCQ5jcQiUwDbcuW1k5H1
	 6V4L6YK4X6/AONRMOFFFvlDRmHq7ZDBNVCfmWbJeRajFWrObUYKBLnjy3Ee9HX48k83p5
	 st1zY66pfWNZxcBHYvAqo9M/g8Q3ZaVpxDO2w+ozutwqtYdYpwEH3mRXXsaQekcHRnwHV
	 I+5u3XkJt5wpOxZbbET923qo+uMaRpYSOdR07Kc7VKGbDDOrZxBfrPPbdwB8mL/M9WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517579;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:X-Clacks-Overhead:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=SwRxL70UZD+xngCl59WczkxMCZLKrjA0KitQMXZVCVE=;
	b=mVSnH13TVbEAs1FoIjYIb4+JOSNw+AKJnN/SHwOYoByWGWsUA2+7Na1+Keln6R9KDu3w
	 2GxaYHSXoNTXUcea7m9HraCdK/quY0P+mr4a19oBawvInOFVNhSH29eTVNNP0cGadoQ9m
	 0Opl7jZBCdSoyvRi8n5PNIG3QGSFMgmU1YBbB06FPaZpdiveBFnoESwRyWdEQtMAN3PRX
	 h2Q7lKjuPhMGCjOWjUomkhhvuGzPTTGHO3YP+tsiGwm34754+bLbabx189vOGyzgVc9lq
	 OcrA6ZU8+LDwphgO5SO51NPEEif/PCGAT2sXWTjunNr0G4IZ2ieCrzvujANtkuu4CAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	dkim=pass header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=B3S7xJ4i;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A412606A31E;
	Tue, 24 Nov 2026 10:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A412606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=B3S7xJ4i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1795517575; bh=FTa+2z8UPFIgVsS7CWdDZQY+TUTg+1w5motNKzhJMnM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B3S7xJ4iy/TRwk7RQiQ13Mv+UHKv+RuSAcM6E1Nxt2NMzTvLtzbS8YGZxTQtTOPej
	 d3e/KDwc0Td3ycbY3nab6jsKxtxAc2TNaPJczh+ELaL1szVgdsL2zDw3iaCJMbjFie
	 urBS4oC9W/+WMIZEtFndLW9gFpsWLU9BP92RsZ4mfqKOg140MS95Yw9ZvrC127Za6J
	 jsLNV88eO0oewkWDaTsaPwerxaXKDj1ZPeIqAz/VYFjH6ErQ5K6dixKrBaT+eKM0Df
	 +J/SMzIhxD9GvWwkjU+bU0/uV2912M6vKy5YOgjQBFACml9x0CY2iEGCoSX/lr8LoE
	 otAIAe+3nisFQ==
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Jonas =?utf-8?Q?K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>, Jamal Hadi
 Salim
 <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn
 <willemb@google.com>, Simon Horman <horms@kernel.org>,
 cake@lists.bufferbloat.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net/sched: sch_cake: use rcu_dereference_bh() in
 the cake_mq sync loop
In-Reply-To: <179549599115.54577.5943710312861930188@gmail.com>
References: <179549599115.54577.5943710312861930188@gmail.com>
Date: Tue, 24 Nov 2026 11:52:55 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <878q2iec1k.fsf@toke.dk>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Kyuwon Cho <kyuwoncho18@gmail.com> writes:

> cake_dequeue() reads the other cake_mq sub-qdiscs with rcu_dereference(),
> but it runs from __qdisc_run() under rcu_read_lock_bh() or in softirq
> context, not under rcu_read_lock(), so lockdep warns:
>
>   WARNING: suspicious RCU usage
>   net/sched/sch_cake.c:2039 suspicious rcu_dereference_check() usage!
>   2 locks held by test/114:
>    #0: ffffffff88b2ca80 (rcu_read_lock_bh){....}-{1:3}, at: __dev_queue_x=
mit (net/core/dev.c:5014)
>    #1: ff11000013ec8170 (&sch->root_lock_key){+...}-{3:3}, at: __dev_queu=
e_xmit (net/core/dev.c:5058)
>   Call Trace:
>    cake_dequeue (net/sched/sch_cake.c:2039)
>    __qdisc_run (net/sched/sch_generic.c:359)
>    __dev_queue_xmit (net/core/dev.c:4502)
>    packet_sendmsg (net/packet/af_packet.c:3157)
>
> A BH-disabled section is an RCU read-side critical section, so only the
> annotation is wrong. Use rcu_dereference_bh(), as cake_classify() does
> for the filter list.
>
> Fixes: 1bddd758bac2 ("net/sched: sch_cake: share shaper state across sub-=
instances of cake_mq")
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>
