Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655917;
	b=DLXTRL/20l98mtbpe3nY6p9Sua6Ymf32LcRnWJAhSo61B+4jL9u5wGGaM0XgYiXjR9sG
	 c7A53pwMNI7acMO273JUdS87uSM6dvlOQ/QAihXs4YTgvmRAie4ZqYT0c5LId1QmKefPN
	 6DlOSRWt6kp7YEowvZQ3URtmZnfhP+psrtiit8hbIrttyiFVC5UGiplrUkMGrjSmbo2fG
	 K6HMx/cnTSx7GtJ4PYmDRzMs1FK0ZDmKeO5EIQO4+QnXzNtVCqhxSA3mbrqdd4JsTeZNL
	 Kt1JlSS+H1AcVVLpltx0TqkUe3ryxctpudDOx9aQx/C32A+mXw2BTR0ldjubvr9WNDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=tCpZfL1wX/OPKSEjb/AJZnJQXx6AviZQjd9JGVl9xAU=;
	b=nvaiOBjgI70lAYkktqld58rpOUqUwaPMATKkHMjXf6Eu6lZyJZ2NmoL2HB+MmS90CBln
	 aiBjXNqSTsCo6KAoC4AfzEtaV+bLCXferWXP/jl1Bk9TvQF8v9ir7fTzxPLijtBcTW25d
	 uuMnkxsuVNev8rP3YVlgq1ZlI4m9TwJ3Ah7Jqin9oy/DF+W68Nx6HEebjJdkS6FSNfgXn
	 Hdv7MWXW5zrZXu28vmeI05wsjL7IR/cZUnIGCd7OdENKXECxzd9Gn68QlkAiJ5w7I7//n
	 3A1QSNux6NUg4/f2IDVw6uHD/U48vmJBqTR0anGnw1scjmZMM24sFTdVeBMDZuMUYXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pJ/mYBYS";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD181606A32E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD181606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJ/mYBYS
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38431138772so8412651eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655916; x=1796260716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tCpZfL1wX/OPKSEjb/AJZnJQXx6AviZQjd9JGVl9xAU=;
        b=pJ/mYBYSMKnF6iJbRuZIYaVgwBrcf+KBaKR8aavQYOpIBC0Y0hfxo1SVsf/YOpTOB4
         05XuN4IbMIXYQUKyU7pekl9cFgOSs8xittuFWVU48/audOI4sm4h6cS+IgKUFGf9LU9L
         s9hWLX6LdR4EWa0Hg4yhjPoHjHar9SGKyfSi8/wItl3Q7MG9yiwJheQ2vOevBTgVy3Qf
         /X/kQcHqJ5Ca4gcHdI6EqKNWEjqbI/meFUzvrcvGgdKm0ALB6jnUmb0BpwBew+CeLifE
         ZGmzMUYejdzXgvmLSXCDcSTDAX1yoEg0AvOW7lYxiu7OE0orBe3a8/MS1/Re5+351ADr
         Su9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655916; x=1796260716;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCpZfL1wX/OPKSEjb/AJZnJQXx6AviZQjd9JGVl9xAU=;
        b=xn7KPZGoEnhjJrtzaGH24c//YXKduhkQCyMWWJSQFa0c7OO0uR9HXfFrqTkF7WkYaW
         XCfkX380QMsX4tBALv4BY2KaypqtCX5CfoXL5Q1RntROTMivZx+fBhrJU1Y3G4C1tFfM
         x1yS0Fk6fp2rL8h1o8ry3riVMr9i3t1IaR9cE1DOqffJ9HLQkyvFqOKVlFHYJxCXBaUt
         WY6CnFQ2Azk6uVcyQYmaXPmIVEl7VlQ97bkbo7q3cyc5BaKpOhXkoi37JfMQMSc0vVWe
         z+Z1kzrZFLxinrhJ+rSFovsaowCHuKV7ovu9ONhbzH5fsngOKbhppPA8UorY9bRRSv3L
         dkYA==
X-Gm-Message-State: APuU4Z+fUvvIKTgeVB3B4TxXhoDu6bovZJAOHMpqspOJu8nGiUhPMGUl
	F4ppvc8MBX3neUgrZgjY4Wl8Xii0/O6/Y/4DYk8dlr1acn8jtouZmlnZ
X-Gm-Gg: AZFdTZegHaH3sHxNT4i/pMB529g9/qIhWKKSwEVa+cXtLzgo6RlTi0uRiIeJVN0Y25U
	5eVoHesLAsi6GwBCHbLNL1u+VTsJxtqoH1LWkNEZaxQ9grTA/q9li8cNYPRyulJ86p7ZBnlZesH
	79Vv3fYnNjRUBC4pnYN1y4itLZ1sKohlMSsotRWTvX3jl7E/X3sUXdnA57Yw7IOEeVO+ZY/GzGT
	XCN5yZeu317fJyrjjGQCTzpTcgkCX/PKTl5arNx3OoLyIQ3jLx3XWo2AW5XX4fyfDaxqDPd0rOY
	+QH68ZWC06yVHB5WIks+JU6axtcsYHoWEHYSg92f0Bgum4OmA7MrkGEutv1FuHQeWyos615mjA2
	iUJH6kJuCugPwz1SkE6ZD+5Csi2IK9nSWCoBuVRTtxqsQql9DD654Vp0p6TIZqLJIZykIcYTKQD
	ZMUI3rjZLP2GOls4b07g+jk72JUUc5Gao9Ar0/RtVVu3kFpbSBoXArb62S3hgcsUHZiP0aQHyl5
	gYO37JbyftODiSUNjU+MVfljRc6iMpSq67Pbj/1miLbR78WqrvLjjEfEZGtAjHF3NmWqeQ24Xrf
	JYxZ3edgRrYsPKO/JN2+udnLow==
X-Received: by 2002:a05:7301:dd8b:b0:372:32a1:b384 with SMTP id 5a478bee46e88-38571510675mr21858154eec.33.1795655915771;
        Wed, 25 Nov 2026 17:18:35 -0800 (PST)
Received: from [127.0.1.1] ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm59493573eec.28.2026.11.25.17.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:18:35 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH] net: page_pool: Drop fast and slow from the params kernel-doc
Date: Thu, 26 Nov 2026 01:18:33 +0000
Message-ID: <179565591347.2620653.10113500685531469666@gmail.com>
In-Reply-To: <awdsddjX8STuJ4WR@devvm20253.cco0.facebook.com>
References: <20261125184640.2407270-1-takano32@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

Hi Joe,

yes, that series is the right fix and mine is the wrong one.  The warning
comes from struct_group_tagged() dropping the member names during the
transformation, which is exactly what Omokefe's patch repairs by keeping
the tag, so @fast and @slow become valid tags again and the paragraphs I
proposed to delete are the right documentation for the members.

Please drop mine; I will wait for that series and will not resend unless
it stalls.

