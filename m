Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019768;
	b=fKbJv25Z+DBlScVF/jp8/LsAu6yC5Jye294MNH2jJVTY229cZ7/WIXrdyeHIlq04NH9r
	 IU37aLX1egwKHxZZznqYSDjKvYaKfYCpYZ4KJCa228ASZrgtqywxeGwiPE+/kL23W5czn
	 yMQ3RfgUb0fTaN741fU9sG3b9dVex2of8uRRZ1NKNikBsD+73DvXjVMdkIdgCWLZjIvkE
	 1EhrBZOlcWU9ol6xXy8ZfPanBPRFffdQYUZDgzyp/3cM/XXkCpIIaZd1FNw83no4xQqc1
	 Jef28HdbPEovkK1TxzVJJYEO9iNKjxzGkiJEbX/0TVcjw0h82+OruUWjI4Ch8/90gXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019768;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YM/UQz6VCYqxEfn9Z81Oz8xe9Dof0Si1ZSiCOnSX+f0=;
	b=Jp7+QzuQsHrmyyMdkBuuB49EvykPjjEPZgzSNQTZwEWR17q2Z7iNq75/qXZoMpNm1hDh
	 1ZWAZjTBcbyhGM4F/v80SPW3MeeaH4T36S76LLDQBPtdblPhdYoIU+HS+orpSEGt8eXBZ
	 5qdDc4zOVFb7qg1+qHyw+ENpTtW/dKpVK+DYHAG3xwFuf3XCw0gY/L1rijPhgcqEWEzur
	 wnMT4lpPd6GI46QWf5/vRIvyJfK5JndlYGB5YxCeyuW2Rhe/1HUC9pGCkwzINBL99cs5C
	 7mVf6fdheybVaNHphvBNlVpKe5hpo8cjT51T4j/19lo16cplFnSbAJzC+u+M1j1wGuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dFgOU3P2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC824606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dFgOU3P2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951801F000CA
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019768;
	bh=YM/UQz6VCYqxEfn9Z81Oz8xe9Dof0Si1ZSiCOnSX+f0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dFgOU3P2I02DekoTCWnJD2yWQahwYhM9B9CltGFSQjoAtZPdEf9KhUpTZctodx3bl
	 URmZIAluSWgca4iPKYIOuDYv1iINRryv9BN0S1ByrXgWKTze5k3jeurjlDoTnz0jYF
	 WVs1+x6ly1eiPDgbh+XzSYUnKnX5xqB6INhjpI2Enq6iPNHb9vDxjFWSa/rWj69jMx
	 L2pkgclxqUSBdDNn/gp1/gpv4SBjDZv9WR9UZVLfPaPsSDilC8lUAV6ZUMm2CCVlGF
	 D+N5ph1HG+8HnSv0T90SvlnCz5bvNjIDE1n8LMAbrYAsSkg/7rcapfd8ckZs8gaHLe
	 vT5nAjIWz2JfA==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-716c0217635so1223854eaf.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:36:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFruH9VtDgfPrtiJFph0DOR2KCbeKxVxR2iq1ruIDq6LqC10bkfCV6h/Wb92B9d71Sf9qRGFPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/61FlEJhbLvaOyrlt31K3mhe3UWxd1Fq9czIwfadPc41Z9Avmb
	y8kLgzQfFSoGAZ/ZVLaYROGgRV5B05zxhOckKdwNA6ixV7CeCkgcJ16by2Op9OQTWa1QkHTflXP
	5uCLzWvOVj+1CBhZF9+pvdlBJHagN5G8=
X-Received: by 2002:a05:6820:1343:b0:719:d9b:d750 with SMTP id
 006d021491bc7-71b185e5c40mr1816318eaf.38.1795019767963; Wed, 18 Nov 2026
 08:36:07 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118155144.18393-1-mason@kernel.org> <20261118155144.18393-4-mason@kernel.org>
In-Reply-To: <20261118155144.18393-4-mason@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 17:35:55 +0100
X-Gmail-Original-Message-ID: <CAL4Wiip_ZpcmLTHmO8v_STenwT-UkZQ2VDZcBfT8qztpDKevxQ@mail.gmail.com>
X-Gm-Features: Aa3M54p2xchpIKodnzexyF-C3oPWKoTba2rDlD6VKVqI4P_L0_jczQx61xKIomg
Message-ID: <CAL4Wiip_ZpcmLTHmO8v_STenwT-UkZQ2VDZcBfT8qztpDKevxQ@mail.gmail.com>
Subject: Re: [PATCH net v2 3/5] tcp: reject RTT samples from TSecr above 120 s
To: Chris Mason <mason@kernel.org>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, willemb@google.com, 
	josef@toxicpanda.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 16:51, Chris Mason <mason@kernel.org> a =C3=A9c=
rit :
>
> tcp_rtt_tsopt_us() returns the timestamp clock minus TSecr as an RTT
> sample, and accepts up to 2,147 s. If TSecr echoes an old timestamp,
> the sample is the age of that timestamp, not an RTT.
>
> tcp_ack_update_rtt() takes this sample for an ACK of retransmitted data.
> tcp_rtt_estimator() clamps it to 120 s. The congestion control gets the
> sample unclamped, in rs->rtt_us.
>
> tcp_rcv_rtt_measure_ts() takes the same sample for the RTT estimate of
> the receive side.
>
> The fix used here is to reject a sample from TSecr above 120 s, for both
> callers of tcp_rtt_tsopt_us().
>
> An ACK of retransmitted data whose TSecr is more than 120 s old now
> gives no RTT sample. So it no longer resets the backoff, as on a
> connection without timestamps.
>
> Found by LLM code inspection, and confirmed with LLM generated
> reproducers on an unmodified kernel. Fixed by LLM, and tested with
> the reproducers and existing kernel selftests.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Chris Mason <mason@kernel.org>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
