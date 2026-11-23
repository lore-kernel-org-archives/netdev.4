Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399091;
	b=W9LsGDixJcpryG2CO+NMVBhqTcFAgjSZmlU8Lq240HYC1S0QNHX4/NKxrxapLk6munS+
	 2A6zhd8FM06GVVubnfgHj0h85VLQdvvC5JwU4+PpKUuKiUW0BTFEKA08Weg6vZ+mBpQH+
	 3+3nJBEib2KxfdnjxHA6wOG/3lBHGiGlQFWOXLfPreRO8FD4e/pxOWLiZF2jFPCLy1wHk
	 WpujZWMSZoa1Cpmw0t1L4qeRxj8DIThh7D6Vok8R2ZK/ON/LVdfG83/Kckv475L4uiNFN
	 q5gSL7ee4aDwfp4ZVlyB5FSMwq6gVJib3d1RVm/wtv+nnQZogPtoSTe4t5Sl5CfvaBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/6m9oG6/G1/S0puY4RqRayaqVyRy90+VEAnpcpDQ9Iw=;
	b=poHvjYHAalPB0Nrh8h+A9cUxw52f9M6URjxP5KTc+iPy3fJhbG6cRU8+zDhwwDEb8BWm
	 uvmM23p/Zyfmx1811GlXTzq6wTJvGxYn18tAnZg9LtUhsSHHAbPwH7TBskcO4Z+OxpViZ
	 49CfeAWRgCpqhLAgH4ejSkpWxawnQlL5KcoTkC95G4ADLu0OGGJ0gUR+S3YDEjQVhP8Wl
	 gmoBzGHWRcYNHsZYL+sPoxrcY4T+mRH5CHSpxpSbt0SRYaW5EbeD7b0FxD9B10au17LB7
	 4XQ0HiBCDUTqEqP6t+lqPqQP5kVP3cN47n4Xa58KPJHf3+AneQJ0TXJy+aJ48LIOvQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KoaGNxhb;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6FD606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C6FD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KoaGNxhb
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38190551625so5858397eec.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399089; x=1796003889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6m9oG6/G1/S0puY4RqRayaqVyRy90+VEAnpcpDQ9Iw=;
        b=KoaGNxhbWXMn4T+/msTNtl/XwQZly12OOm9gE+ST+YG7+TM7gWn54hU/Ozmi4jkYxL
         81VD09Dg/KTZLmdsTDgws5EczLVb8WqYb2vsX7qNvQYO14VWrNAlvdn6t865nxnjiPVZ
         lEzBfDpXisvBmRNWwCpWtCzwmeR7qTFIRnR5bffYhJ2DqtDcXOof/+GK8Jb5WeO1ozJ2
         CC+MY7T4nZ9Ep9L8D/ZzyD04q36Cdb2JyFaq4HPcr8qvuASDWBEwcNeStgolH4A7OX/M
         hIHPZo22uM7PzDQzegM9CV9a1O74WiI21aog6DrSfUxLVP/65BabyMbwy/Tk5sYBlOGy
         oKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399089; x=1796003889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6m9oG6/G1/S0puY4RqRayaqVyRy90+VEAnpcpDQ9Iw=;
        b=c0aDx+b5hYpvfrIV2a6wmIxflH5PgTVkbCqTo/GV/zaSGB2u5ClU7X19ajaVXVQQ9k
         nMoLKJpe6n7XkeN2OHeN1cosp7ZPnFq0Umym9yP8je8W12ZNUzBCRscjMICy52LqaSzf
         vjjd6oY0sB9/4SlniNTF4YANYADr7N/UgqsJ2YdmK95kaxVPiV0XCy6QG0sTGnJC4TTZ
         /0Pn1P3kDTjCGPt8agacPlHE7Y/uutKWZoH/UFKq1GdlOq0DuIPDXXdarzpeBf0PAfIO
         VLaPRpnIBCjmmRAv2d4vAbA/ONQwPbLPw2RUfNreEV+pExwZ52hwPkcjij5HZ9EhEVD/
         Csbw==
X-Gm-Message-State: APuU4Z8eDGMq7lGku6QgNOQKpaX9JVaonB9e3vyBRmTPgBeybPWSulVF
	s5r7mqHSLBaog+y/xEmMKRnz9lCtwCUI5QcleCoh5HebExUJMiEUw9kR
X-Gm-Gg: AZFdTZfhDnooVETEN3MDhTLinu03Il9LKrcCkVVXeMeci/KMLBke3tXZsDvX2BQHGMy
	/nooFvZrI0kz26CSF0CHCJyqNE/Zfa1Ft2YQOgO5NW8klGSqDLa96OeI6E4qY/NjbRTv0dwrMV0
	VUXUZIDvxtfm7UcCP/TSHKaQys0zet3QobOdZ4r6l+gJzJxVzejPdbrjBnFKwHhWsxKj8RnSzvD
	/UIRc1t+tLqsZn06d1YJc7PVCOFhHqksQyCzV8JvWbJGbzoMkrffXh7NdLN0+iV/yXdbEM5tvrg
	WICgTArifE7kUeHxv57ndqU1fNY0SEHsUfBviRBzILBc7R+REseZBJy08e5XWY2Qp2pLIkOK/Oa
	bzJFcJstaR6oXwztzppQ7/0zDQEr5V/21U88DVUbrGccyNxwjbSMeTqLexpLIO2tWBe7Nsl8IJ1
	phFA2F9NX6lqfmC2RWdV8qNP8UGgeG/cf3iVuW7UCH1OOshmvIoG+jbn5lik6dKRALRsFQhRXr+
	i74FfAIvnEtdKodGFMueDk8q0jhPUfJGRT8o2q3bPGhJsLfC9PmexInDM+dQnisQqCWbRLLFllp
	bD0OsB08AVyLRwi0CvEVNxU+jfl8fr0gxdYwtyhxLo8bhiVnadvxw2DF38hsd5YsZQjeykNszC1
	NjYvcgR/hfK7ojXNCWexrozWmpwrDDrItzetiYFfqV0OEcxnVR/r6iXQfv2imytIZOya7CTnD
X-Received: by 2002:a05:693c:8642:20b0:386:9e22:ca4c with SMTP id 5a478bee46e88-3869e22cc7emr7180886eec.35.1795399089350;
        Sun, 22 Nov 2026 17:58:09 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm27647281eec.2.2026.11.22.17.58.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:58:08 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH net 1/4] ptp: ocp: prevent timestamp rearming during detach
Date: Sun, 22 Nov 2026 17:58:06 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-r5-ahmadexp@gmail.com>
In-Reply-To: <179538006639.3135.15219639487891578509@kernel.org>
References: <20261118-timecard-common-301f823ddd-1-ahmadexp@gmail.com> <179538006639.3135.15219639487891578509@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 22 Nov 2026 at 20:41:06 +0000, netdev-bot+sashiko@kernel.org wrote:
> This isn't a bug, but blank lines separate the Fixes:, Link: and
> Signed-off-by: lines from each other.
>
> Tools such as git interpret-trailers, b4 and patchwork only treat the last
> paragraph of the message as the trailer block. As written, is
> Signed-off-by: the only trailer they will find, with Fixes: and Link:
> missed?
>
> Could these three lines go into one trailer block with no blank lines?

Agreed. The trailer block was made contiguous in v3 and remains so in
the v4 draft. Any new personal sign-off will be appended to that
same block after review, not separated by a blank paragraph.

> Could these move below the --- line so they stay out of git history? If
> the tool assistance should be recorded, an Assisted-by: style trailer may
> fit better than a paragraph in the body.

I moved detailed testing and revision notes below the separator and
removed the repeated cross-patch workflow descriptions. Each commit
retains a brief, patch-specific validation statement, including the lack
of physical-card testing, as required by maintainer-netdev.rst. A short
provenance statement also remains as required by generated-content.rst.
I have not invented a new trailer or added a reporting tag not supplied.

Also, this report is on v1's mutex/stopping-flag approach. That approach
was replaced following Vadim's review: final channel shutdown is handled
by the PTP core after interface removal. The latest revision uses
explicit timestamp-channel requests, leaving the pin helper only in the
pin-configuration path.

The five-patch v4 series is posted separately to net:
https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com

Ahmad
