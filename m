Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626462;
	b=CbvdZ/PtWIaudckrTN+FBDWK4wkA38AffPJLHTDvqBQ9wW92hLPSGXQZYOkY4cLHDV6y
	 NE7iBHopOJ+UZGnXfMfL/Y9M7OtOXVVzJUS+eA60i+XR8TobCP9xpS+SvSlK5d5B/1JnQ
	 MY+MbcWkXbMnRrF2uieNZTXSiBuwXC3mkvJN9d01AXvJwOHYbBrRWQv61S4CVjB5GEPsd
	 FrBhkukt38ozQzUy0bydvzGqjDJA9ogvbsepUDWAnDoAgFvrLf71JdFQBOq/7yrKLrLSe
	 +4OmdWSrxSAYV+gMTha8AsVwjaqjYvfz2oRRIskaZE8J+c+08EsoYe5U4mqvBQo0EZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626462;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=grDjANSByN4QrIdxpe/rOOoVKB5IUdQWfl+i+PjcZTin0S9RIB9h21/eC7l+z7xWeRYZ
	 baUOcKVh5diM1eeUAFMZ/diaYs0I/0RPNbEL1O9jCXnDhJxO0lun1O33AdmqBiPARh0ui
	 Ub/xt+02m/YG2Ed2hVatDPEqN5V0D3Zip9TcODWoVhPS82sz2TB+Vqo/w2v05bJ08M7Lx
	 Qi1ONbYunmAOiDBOu2h0miC29H5fXzcj4foTIjtMtvHSNUkdGBSYseMk0HQYDSBWsj7iC
	 32pi+MT6XcCXmBP4ZgqRa3n2UuDlfD1dXQf9n8zXwB0iLI8YQ0+YToi1M33ev0HZKCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RTaE+zJD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D7D606A32C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RTaE+zJD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A0B1F000D0;
	Wed, 25 Nov 2026 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795626462;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RTaE+zJDZZIDMva6nbGTT7BKdoAq94vJSn0a7Ay6pFC5fN9Xj8otpch/ZH/rEC4VK
	 gBm8ag9UeraWOSZnQ3hpIuhUlusEsSkfflpA3hC/vV1qx+J9u8TrKFx1q7ub3ZyPPu
	 VRaTm+kBZDgE8zUUDZAOl8CaURiAIbWkboKoUd5IsIUJ2PaDnX3SxzFTjrsrtdfqsg
	 X8+PcCw8d80+Box9w2WkeudxbHtiQYtgkWU+90Rh5Tll9bzGBnMkDYaNYj1a5eYOQk
	 TTKYRQWyUmZlr3iVr/w66aJUdM75L4hZIJfN9ATTK2DHEAnOmSc1e7Zd5mBc8DzrXs
	 g8xKmtFMh4dLQ==
From: netdev-bot+sinfo@kernel.org
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
 Milena Olech <milena.olech@intel.com>,
 Michal Michalik <michal.michalik@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net] dpll: send the device delete notification on the last
 unregistration
Date: Wed, 25 Nov 2026 17:07:41 +0000
Message-ID: <179562646113.3294.4642015829884997946@kernel.org>
In-Reply-To: <20261125170234.294969-1-ivecera@redhat.com>
References: <20261125170234.294969-1-ivecera@redhat.com>
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

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
