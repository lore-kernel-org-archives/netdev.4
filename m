Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027388;
	b=crq+p7MVAemIteBKUFg9wfqzxTEJXjqR/I3EuBCBE6uZJYBlgXgmG0+0JXrEIscgG0T9
	 pejRYLBzeM4ojracW9GlNSi8XJjg/OVz6epmBj2C0kIzZ2QliJUlUDxPxsj++Ez7ZgYmp
	 NaQ3iG/VSpwtTAF3dOfq1pzIlesafZBq0VuLOUATrVwauCJR2VCHdAP7eFMl6VSNGqxkS
	 TCPzYj6T06hkid6EkjY95kXBlsdD9mW1Wo//ZlR3c7UAgM0WxnqOfQzYaola91hP6VZn3
	 PqtduOfl8L98xNx07DE+EH+XFJ6QTHD8EAq/VieYiCti7G1wg0Drct9mVZI6+m8FlxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027388;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=R013NRHx1lrpQ5Bx2ueYr2hLzrY3+Ta2yr4Ky1ei+ft+XwD4pxYQla5IrSEDkmCHTOZK
	 0AAnzZqgca2zKvhcBH+u0t5xq7gs8e12OLGVJcFu8jaz4ZHjazez6GOPGlOpGWs4yvaLq
	 qch7A0aBtyVeBlXiv9NEyJ7iASn4/j3W56ja74XAVWeltZeFnjQU1pRNdkYfp0PT/7YeM
	 Ddgu54O3zw6U96ZA054JSITQmvF0RIAM/A4ZTPicwB1ytmnZwyBxEmb1rP3Ap2civOxLH
	 DcFDIjg1gwjDsxVsH6fqIoL/w/ifREEA5L4Mm8gLfkuKpmknh2BmEnpJbJhx+ykgoPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyTePX9o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B90606A334;
	Wed, 18 Nov 2026 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyTePX9o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B151F000C4;
	Wed, 18 Nov 2026 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795027387;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dyTePX9o2IOPwaqBC6mSIXgb/5UZF059M9R+N+MAqYU1lMur8LpfU769Kf29HmI7C
	 AZqxRiWyy4H2Ofl59kUnsuNAJ33PCMjQ3rPKh46Y0Ket4V08YS9coz3kJADCj24Bjb
	 v7xvJVDST0BtGFurBROzaDP4cGywl9SGN+wWwfHgL5IIxMRB/rqXDvhqVcG/suVFLj
	 THqvO4xzBru9ZU9b71N36OqrdI/39zlpmuzdoZ3EKXxRMI0P5fhZl5TmYkBpEL0UHX
	 z8qSN6wPi2uI+Y+AsvJvXEX+aarm7+PJf5tLqAfptgatuvn+r78JptXx5iaHPZihl7
	 Gj8ooOw+yEtWg==
From: netdev-bot+sinfo@kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: dsa: tag_brcm: fix link-local detection with a
 prepended tag
Date: Wed, 18 Nov 2026 18:43:06 +0000
Message-ID: <179502738694.3291.2857896410647833767@kernel.org>
In-Reply-To: <20261118184004.1916105-1-florian.fainelli@broadcom.com>
References: <20261118184004.1916105-1-florian.fainelli@broadcom.com>
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
