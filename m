Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555359;
	b=fD473f98KeFH0RFY+kpAHaAxoQXEuFH2ahE/dmVKoegvG92W5mqqrWXt/d2EBDhBapfi
	 Af9AVtanA5//MuTVf9Ti5BanieuR5QHXhrnXJbwL25s9F2e22n7Umxv33aHOVTzu/B8zd
	 EI/56MKtchd8Wh814I0d6vXnhnRV7e9nY3OZ1eGnbYNkJxzbOmb8+thQllIka1yc8O+9A
	 71+anbYh2+aMM1YVqs4UrtkIj3fBibB7rSq8hnSQ9cuuUZ68/OMI/AI3x7H8R1CFOeQQh
	 ags/R/JVRxefyxK3QTdM4N4SReKn+ZH3kiVhiiOx0+U+pFF6jj998FxV9z1HidjXG/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555359;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=pGcu5j1GrDoghOCWLQcX5pghJ8d+cz79M1yHJzlwXC8B3lQCvMvVk3P/j7gTUijVsktn
	 evO2DKhNC8tETMSvq12/CSXgT4Q1icvuD/RePXJpQtQ1xwnxygFGaR4xzb7FmEMEpErJV
	 O0p011N3YWI6PF0nRn/WrEZ39tLjXaL+WTB9K4AY/Hu4u+zAOpiRrd4MtsdhZc87EhTjR
	 ui1VMG8sv/UUPDndEAbrq8qTH5pN0KFYKWXhtfHGyDaoWLohLwODCEnx70XIznJOd9cws
	 HgpnnoWnnNA9FpSm61OI20k56ZKd1/wyaeeaiGmvXjJiJp2ABSgc83pMYW6x5Dza6OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j4TZ1vYD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5DB606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j4TZ1vYD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425F61F000C6;
	Tue, 24 Nov 2026 21:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795555358;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j4TZ1vYDVYabHKM8Agx5PvcY2sXR95/I9jIzEbLwukF6G9WDwT1C2L4l2GB4eKsMP
	 xeszGZcMVcl/EpZn6wppZu4jq3uuBTFcb5N/4b9XF34xh925GZnHqUCM9mZp5HdsqI
	 Hd2WYBMvRPsnSL4fbjef1kNJVx8B4pPoVGaCYwzleczdf6MR+2MR0CIwNl1uQZRJIW
	 FyrW1II8bS96svkY8HBx0JaW+urE5PnvUgi0ZGf631ZzNF8mvPzp26WOFCdADPNUMm
	 WIjgWpu9ukA2oGZf7v9H6c8LSaQ46QXVov3zsoxTYNR3Nai6D2w9BpJ0k35/lVEcPn
	 3vIw/BFpWfBpQ==
From: netdev-bot+sinfo@kernel.org
To: Yuxiao Zhang <yuxiaozhang@google.com>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, Paul Fertser <fercerpav@gmail.com>,
 Simon Horman <horms@kernel.org>, Peter Delevoryas <peter@pjd.dev>,
 Patrick Williams <patrick@stwcx.xyz>, netdev@vger.kernel.org
Subject: 
 Re: [PATCH net] net/ncsi: validate GMCMA address_count against packet length
Date: Tue, 24 Nov 2026 21:22:37 +0000
Message-ID: <179555535780.3294.15453808391107962582@kernel.org>
In-Reply-To: <20261124211830.3298822-1-yuxiaozhang@google.com>
References: <20261124211830.3298822-1-yuxiaozhang@google.com>
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
