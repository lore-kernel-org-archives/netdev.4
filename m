Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000344;
	b=W9fSKL8G7z0GxIs1evhETqFZPt8qYQMYeGxj/tKsvkHZ1qRDdFWT5hgimgFmOgOh4sOM
	 r0m5JwaLlY+/t0/jNzHb62Zl4aje1CvYxrf8QfKH67/Pg0HgCLXKf5P/Er+rv9qjjqI8o
	 rOWa2fy4FHh6xjOlIDzNu0or5ZWzs4kUtRRrIZDUUO490YtJlTDR1RPtUEd6+8+7FSHjL
	 gG+Ll6oq9I6zXaKa3qoR6Q/AsBquc2VXI3MAWJWmzbgUQKsOMUEUUNdM6HGnH3WyTzSvN
	 TeF7VPZAu3fvD/SE8P76EaSY3r9ygaz9aCLvrviLtvbxESBAb+Y4pNaOb8vtdJy67Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=53IUSq9d/hk1iaXQ1eoTJWrnyEolczWzJhhgu4AKlpo=;
	b=3coV1T+HrOH+ZQCexPZoEJHDw73bMV8taXfs8SaO1wisvxb81T883sfIy2LI1Ex15k3q
	 xFjwLHEWVUYa0hg0R8a8PiP2zEFlNbatYoFvPpXyAVluXajw1FkajFYsUxpSicm8vuP16
	 zjDIchiTt7Cmol98pg6n6QG4d4a0TnuYI40vMtyxy+z45R6qrJElYCTccw8j/G56PyaZJ
	 alfdfEDu3uSFSCkL6ioltRTCSo4Gy1xkt2uwzh5MiYQFKaIC8OAH653Ad3gkkn5uEjWHU
	 78ZuKYgXgHo51sLtHroqFlGcGuUnCP2gJcF8PPWtSm5GT028mLAG7rtFbitOe6zHd0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fn4EEAIe;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD4B606A332
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 11:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BD4B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fn4EEAIe
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so2080144eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 03:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795000343; x=1795605143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53IUSq9d/hk1iaXQ1eoTJWrnyEolczWzJhhgu4AKlpo=;
        b=fn4EEAIeEpRx+AnRh0wkedAQ7ceRd9Ww8JOclttNSiiYHTkONMmyWWsQYQ0i1hSI76
         3BIFIuXOvpYWPfmXMMPlO9ZyggeGqvwQVrTvfhR1OJuxEM+5Gua2f3eUV5kShdtoemLO
         kRa1DB6bKUfyS+HeB7lcwSGUMg+6VxmV7TFcelRgzLe006d64bZSuLh0rvmc8A2prAJ0
         YEGgL1SM8EL5pU6rkU7B9ky5N8F8tRZRlvbAqAvLtsPhmy11spnC8mbKcj+ExEWd9Csh
         NRvsIJyROWyyXsYdWRC6wW7k/DF4Py1QgcRovGoHhwhlaBQoOLTTrJRySpOVpHoaUazM
         i4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000343; x=1795605143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=53IUSq9d/hk1iaXQ1eoTJWrnyEolczWzJhhgu4AKlpo=;
        b=J4WHYYVzLvGS6iCBuzPpLfRfRgd9/GyNqb2GEcg4khULbmVIgv9beNeKX6oVVc80Ui
         Qhdv1VFtY09oZxbgHjdMlMSL9gmYXSUeiOiKhe/4hCs41OzZZ+29o+uflv7HcYoNlmCB
         ZzUZete9lMeocq31o2I8FmVPcBEVFtSF6a4tD9GWuL478SLvkNKC45zdqb4FSX1PVSZq
         N8wLzjX2ERTp2EVTE9KI2oadmKMgU94aRVMhheQXgROTeabRYD0dAoSyKgfsSrhWrjkP
         NTbiQj86NY/Zg4ZxgPgb9HVr2w/yh6WSJfah1ucIkS2Lxd+5ip7auHEWIr1wIV6EjKsJ
         lPlA==
X-Forwarded-Encrypted: i=1; AL+hErHMdqefA1TBNJyovPjX7Mqvzxgxihcnnnj3+1M8kZjj6VuDcBAKDcvIYYbk6t1j/m8qizuP+FQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iD3+6+Wmi7PFIDEMCNtJJuvqBBWi2OtCclVFR6yHLCdlEw2+w
	Q+MXhh/XjHXboGJBOpZtZanQ2dnozN1IXYF1Y08xymSWmlX/gnJnN0hW
X-Gm-Gg: AZFdTZc3nvK2VRPkvqk3ugM7bU3BiqomDYa7XIdkL+sXEiUVGwIWU1xzMqef+0QGtOH
	2Vjn360fmWNlzR25MsqdDFIxDJGX1gy7H6Yziw0JHiLzhhjTt6bIVHEsq40koGqPsto0gsBwJXF
	taCYmUtc8FmFM9AT+yxmNTf6Y9z39utSVWgFQ6mdhHLfwiYJXrw1lRgWSEOW53b6hEWg32IFTAA
	jPel6l/A4Bvmy1QPZbjF4/ZCfpkhbonkBpxkKCKDcjAUwqxeFexBmcMkaBuXLVudj01AYnOWmdl
	wnDwvR2LFeivnoQbGusLpr+3LxcSbSgmZZu3l5mgIyIOyiJyALaVtyRn9CPCmDLm6/5Ctm0HoJj
	T5Bxu37ii+95/SWzgBx9XLvdnNlbIfuuEDlv8Omoc1TogeYBLbaUZk5HWN1jcXvXVP1BNOlRiL4
	S2i/ivUpJ0tXr+0VLycfq+7+XiyAIyaDZryYuTahTd9tMYr8bPFOEQzryS6sEZwAsMtM4C8iPrp
	q/a+OhhKUMA10Up49Lb2RHY/Jw/e+dwlUDDrU9FqZm/iDHySlyDdj2KLRZHOFO+c8OtUSrUlPUe
	PsI7FhPunP+RemdVBmsVMKC1
X-Received: by 2002:a05:7300:271e:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3827fe755c8mr2374157eec.14.1795000343264;
        Wed, 18 Nov 2026 03:12:23 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304efbsm12327831eec.7.2026.11.18.03.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:12:22 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>,
	netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net v5 2/2] selftests/net/openvswitch: check that a failed set keeps the features
Date: Wed, 18 Nov 2026 06:12:05 -0500
Message-ID: <20261118111205.1381184-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <119b21d2-31de-4416-aeed-d1f04ffcfd82@kernel.org>
References: <119b21d2-31de-4416-aeed-d1f04ffcfd82@kernel.org>
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

Hi Matt,

Both make sense, and I will do both.

I will put a changelog per patch in the notes under --- next time, and
mention the CI error there as context instead of a Reported-by tag. You
reported the hang, not the ordering bug behind it, and the trailer claimed
otherwise.

The CI link was how I found the hang at all, so thanks for that.

No new version for this one, as you said.

Minxi
