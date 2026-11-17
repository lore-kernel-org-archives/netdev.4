Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919658;
	b=tu1DaV8jHeluecNLmCjWVoXJ4c7jOsM4RImjg0iFpLxznTNeb4GIiJJ1sXSmLV/mEp+N
	 OY1p3/AykPKBMvG6q4hLsQW/Ja7FVEL83SEY4JbgjRWq90FXLQJeDHWmQ+ezg7L3MLuIr
	 6mgcnUZ9R46mBv32BP8vTyz1ga7/6GhnT4UdCu/EiV3TuksjcY6jyd4EhQHEoVrZKOQ09
	 zWgAmna/Y+4LwVZZV2d6IJVoUMhvxYFPY8FZtkfvdB45V9fYGgqq7sCOrvMf+a8k1Oc/w
	 YqNngKDjv5Bjy3sOtwNnSWMs3Z0a5WWPy250oxXOM4CHTZGrFkbAG4pVQSWyRrjYCxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
	b=FItL4tQjfuBkc+Ux20T5bFtoudGM8Dse6dHLufQjp9oRLkFbj/CNQpVjNG/tbRV3JeoD
	 uJ7Q96a1lozqAhkOzobb1NYehAj5aUOebAEeF4FcSeff6nCbr4c5AQ3axRcMFUCzFp3h6
	 QGdGpJHUOET8E8TBKFeQWDUVkMyfwKu/g6qRJH1iWolp7TU0VSFg3CoqtKxU4Y0EblFLa
	 6yod6b7UUKE7B7e/Gnhwrmaa7TBOe8WyThOSKEWKOdrxlYVYGZcBLgtBF4JqYwIHb/E/G
	 dPcaUjy7ERun9Jukr7AlrcmblSSf0jb9tNotw2CpaOolKoQq2daC27j45VVvxi1SHDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GR//esP/";
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02998606A332
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02998606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GR//esP/
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso7022331a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919656; x=1795524456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
        b=GR//esP/c4jjW7kiru6z01qnxOfaFo6rWysyC+LikP/1AVwDdpHcQqSz+pIcMSZZLL
         rGUV3uBrN/ccnmzI8R52Z4Oeg81aVtcX3vBb2DF0cDUxgjk/DXT+msphxH1pfVcr0lsQ
         yDvdqxlzl80F0AdPjBiECfnY0M0O9euYkDkZxrG9V8PqqSLIuANgdUsb4eDMZOsjqE7i
         QWVyyrPvamr6xPGKmSQQBuzXyrQJby/WFvm7nHdgO0G1Uvk2MX4MXJwdwBXXWKBv/DrA
         PJ2GLNHpXXGTG2b2JjZy0uSFrWV2Oh1i7GlvXxKrGOGIZZU4eeELgJR3VfZ/TBqqZdR4
         S3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919656; x=1795524456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
        b=S+9kHFbaE7flwC0Iex38wVK8rows1LET9WKvIGyIcbwP9cy4vBd6zA3QfQ1UNGGb2S
         yZMWRCyZ+HigkIiaTco/aTiDLSEdCe3JDe0LXGhdfQ+6fxzwJ1J8/BCfq+rgolJH76hF
         GwH0EVQqZwWFVSuIv3dQPisjrczZCrCPcCE+ypUK0MhoRTjf6Oj8Ojl8A2S3P1+eU1K7
         WIq4J9NL752MyagDolrQRsarG0hu8cFFhJ76nBzKIMm+Y6fBU+LK/OEy0fydV7JUMPtF
         zBcMjt/RuuCPYutocbyCqzrr3Nkn/P8YqYAtgQy2JalZvvUfJG8QS/zMRjPmWEcf2I9v
         5L7Q==
X-Forwarded-Encrypted: i=1; AL+hErEo0YJrn6X4gxKbdeY1B/U/uuRJYDvNXraUSHJp4yKF/E56wZwthC2VcpyjNQJ4dOrhtLIttpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RGDWaW1fmhhDF0bDbE0W29P4srmJl0iHog/ypsxs1qEcbkbfn
	DiXsFCxTeMBR+F1+K87QdmCR6zThpkS7o/cB6aZVwxU7IMtFqVDOmjso
X-Gm-Gg: AYBFou2bShBHesLXdgqr1Ujr1TAVsWxNrIpyUebIWETllUwaOAOh53bv1HesYW8G1o4
	rFe9STFNCvxis0OfKRWps/ST19o10UXUhp1IUs2Ub0JDLrUMAhqQmrV99XU9QsyA3fe1EBIcXVL
	3sSPUivX+KMG6HyO2fySD+dzG4z25H7AXia+end+sueTNmNbaBxgjUVI2e65VsPlmMnS0pmGMb/
	xZu+f5usFEkz4+QFRdSYNgJoPvccbV0bqLUpvMT4D/cJ5GS4FaKYid8yviY4mEgW1vZJZMv4HoL
	Kdty8IFkCJPuBrE49E0dN1gp3WCW5FsMx/wj/Z3eEXgNid7uPABzaCu5PpfCDrQnJp2kQDxYk9L
	e1+7yBj9hO4q1DqXd+Ov2QJ+twH2j5QCKat/ITNEK5hJVl2MmjmYvGLJN17Ffm5qyc9dtMIfCIO
	2iN/uX60n3Zm3SMIXLGxHOa0CgOdMMXMbw949cxGyGMQkeqIx3/cWS2R5YTIrgxWGz/NSiW5Axl
	8beqE8BGRbAxzCDon4clYWn7AnbkBL1sISu8OG2VBky0BJkAi+iEVmFN8zA409zrGQ1/TVQ0gxL
	r4ZPXylOlg6AVs2RfVn0dV81XKi0n6L6L7mmODiwEuz4n4bKQM8VpJc+/jNsS6zUhvInW5AJB+c
	Th+xGXj5KepNvP6MS
X-Received: by 2002:a05:6402:2347:b0:6b8:7d2b:4dcb with SMTP id 4fb4d7f45d1cf-6b87d2b5390mr750722a12.14.1794919656177;
        Tue, 17 Nov 2026 04:47:36 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b87368c70fsm430430a12.23.2026.11.17.04.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:47:35 -0800 (PST)
Message-ID: <6afc4ce7.4b925a68.31e7c.7768@mx.google.com>
X-Google-Original-Message-ID: <avxM5Ldccuc6TgM_@Ansuel-XPS.>
Date: Tue, 17 Nov 2026 13:47:32 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v22 00/15] net: pcs: Introduce support for
 fwnode PCS
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <179491941687.3291.11313796890436002644@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179491941687.3291.11313796890436002644@kernel.org>

On Tue, Nov 17, 2026 at 12:43:36PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> -- 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

The RCU """bug""" was found while evaluating the code. It's hardly possible
to have such bug on real world scenario since PCS and MAC are currently
tightly coupled. Nonetheless with VERY BAD PROGRAMMING it's still possible
to trigger it.

It's both a fix and a prerequisite for having standalone PCS support.

(hope I don't have to repeat this message for the next gozillion revision
of this series...)

-- 
	Ansuel
