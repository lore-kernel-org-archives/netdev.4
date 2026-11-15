Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773469;
	b=e9DXSZQFi/M268vz4BAiJp1fiFQ5fXnUQqP/0AxCQn79y/MlRMe6cVUu/vFZRmlP5DeV
	 ndT85SfYTK0wVyaLtJRwgpdeI/b8nlyq/PGXX7B7+NJkaLa/i/KEF6TpanQsuLOhHgUXg
	 p9V5HthFwnnCBKGH1rhd6K2bHqMCE8afrinrJdd9gsZHE3SMc7t73FCmn48LsiiXqf/r5
	 GdMj9Ip31/vpLJFIYuDT4PYQGSeIsKpL9vVovTuVVsoZQbZf+QMJwvaBWce0bkfPK20Th
	 lb8voAIly8g/uJ/5Izwqe/MTVwIMHfXukBgJjNsSiwTby5CwNlCYAngQIUUGJOXUKpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773469;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=TSSSWacyuYPGNC2Q4gHzaJi5Z4ZmIlEB86NGnaKBGDn8ScY5jeW8HqEr2GUxW5KiaeVi
	 2xPdZttimOxFpKbBAVmYWBsJ/1stSJ2HrrTPpVQmG7gUdMZwXYXh+vGDg/4G0sYuqKRAp
	 dZIAyfTYe/wTwI8eW6hAuR9n0hHKHsc8d6C1NDMDKehemTkPPVoCSfi8FfHUOteO6v5+a
	 ZlBrzpVx5CVIUL/QOkIDtpaMJj0434ApfWLgXuxb6HD43n5QQ0HZ377GwLacsZbOkS5ZK
	 m1fITL2we0mRiz/+Cvu/SaKPuVfqvJ2eu6pYJi08VMnvwj42mubYvYi0RxjTtxUazwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAfmZGFc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480B606A329
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAfmZGFc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3CB1F000C4;
	Sun, 15 Nov 2026 20:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773469;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FAfmZGFc55xk+8mYivHFXHahCYMzC/HqCNHo4H2hoHWDBXsQ4UpC36SUfc6oMBXeQ
	 SAVEXfH6rmFALmXgVnHwnDIPzumJ/UllawWAXFwEUCpDILqAp6BUFe7GeJ/j+hw7ZD
	 LipPBv5zpM6B/HuMr434KvjGAp2bUqBLFF6FtDvrNSQf0knKYbS49q5EtlVUdVprV9
	 V+HZRPRGvlxHF7Zlix1J8OX0XWT6R6lw6Q/z/rHUrXp1gJqohM1ib10mtFNeBzPeqf
	 wbZ478XB0L+tQdBRM7pNbOF0mketAXnFIqfBngiucHVMEfFrjLV+Mgcj7Wcqjf9WZH
	 uByQUVU1hZL9w==
From: netdev-bot+sinfo@kernel.org
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: netdev@vger.kernel.org, akiyano@amazon.com, darinzon@amazon.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, atrwajee@amazon.com
Subject: Re: [PATCH net v2 RESEND] net: ena: set admin device pointer before
 queue allocations
Date: Sun, 15 Nov 2026 20:11:08 +0000
Message-ID: <179477346859.3291.9150521529248805058@kernel.org>
In-Reply-To: <20261115114239.2308017-2-thnkslprpt@gmail.com>
References: <20261115114239.2308017-2-thnkslprpt@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
