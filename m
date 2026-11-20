Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146785;
	b=GoNFIarM+Ixn2zcHaQkxYxeq0CY6muAs9vrFk1vrGXU0H/v3QQe7xSMR2dw7PnKg9Awz
	 OxmIavBBNZ45yCvu2zqaaUmIqR9UbXxOHcJ5yiLeXk2Xlbr7dEzheHKLYrVckQUdHRpSf
	 128419Q+qk0DV83RWdon0sHn3rDoKg6TnACHEED+R5nZ7Q4osnyIefQkWTzJYf+TgDKLA
	 bXw6RqjbVsso6kzy8/cBUpRInTgN/3m1FYWm4rK1tQ+ESVEubH+lQx4DO5G6pgSJHkR65
	 HJ1pNjhytVHQT/hoHJip6KbL0VSVYSWkZxQdT831nIJdQ5bf9SyZhm5OAI9p2moyhGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146785;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=ETawzjcTUlYTKP3zr7dqJuxM1OlO4dZdhajERSb+Ggo9jcD+acV8lt+S8Ww0yhj0nqNk
	 SvLVjf9Y2dyrc+WfwDZKdTvNnxIvpwgatU2R9kfjsQRzlFjGjEtTCMERUYfd6LZ6jgFxi
	 CbOYB+m2kiOo5dBV+nLByM+wbbWd5Oufh4ODRWkcLQT7xJp3d6czNYFeYxg2PUQ1g8S03
	 GCT79qxdOfenCJ5V2S+/PAQjggw/q/RByW8MjqnFhHXvfFVYdOOlJQzBVL/fXidNz1ww4
	 dJXtg2h2vQlkCDxk0LMjjKXo/pqwZquUekz2Xn1N2JAkJwsNMFFLDfTe60lfSrMgzFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PnDuadPu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0289D606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PnDuadPu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8D21F000C6;
	Fri, 20 Nov 2026 03:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795146784;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PnDuadPuf1p7edL6IM2db0I1M+lGeex/JOajEFSt33bHiEqb3lg7Q2xnIU4lCDELb
	 aZAlW3Swg1V8ay0d/iV1fPkgnd1Mr465dQk639uuvOJ0YIT+I2SyMi4gEiClqDiQJ8
	 FKpxOFNjGaATNGvEwM6El2eIfdV7bvYA2x/v10E4+Yt8waRB7MQ45F8Dq8feh5Ngpx
	 j0BywWOhJD8Z5QqivbcoKQ87cBlbod8R9E4MQhG/mnd7kPIWxpunwB8+KjUMq4V6sl
	 ChUWt4HSVciiGIY4dYiHEWfB4Spl4YldaqObQl0SOPNfxyTUpqCswencT0syliMPrp
	 cp7XL8gCh2Kvw==
From: netdev-bot+sinfo@kernel.org
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 somnath.kotur@broadcom.com, ajit.khaparde@broadcom.com,
 michal.swiatkowski@linux.intel.com
Subject: Re: [PATCH net 1/2] eth: bnxt_en: restore Rx coalescing after
 re-allocating the completion ring
Date: Fri, 20 Nov 2026 03:53:03 +0000
Message-ID: <179514678343.3291.6750195510984508981@kernel.org>
In-Reply-To: <20261120034645.364630-1-kuba@kernel.org>
References: <20261120034645.364630-1-kuba@kernel.org>
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

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
