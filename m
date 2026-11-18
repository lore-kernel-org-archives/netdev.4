Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965374;
	b=A424GTlghtpM1Dm5Yu/DS0d9ocR3qHl9fQw7tILGhqrQgKZs97ac4+XSsoITk7BRc4EY
	 YmUfG6vCEtsceuZjB265sI2MHzwAGUlDw0j9QUzpqLkcNw1g15cmqTIF3GM2j83MwxXnp
	 X+4QqXMjYJcwJ3H/StQxefegQISBkIzOTgwgrGvJ16zeb4Ndqe3THHPXFojV0F3xwjsoa
	 vRoqaJmVwUEC0vDMe6PHhHoGS4lqZHfJPvBkz0iN4dBQxe49GJINADANwffvxOtEp1Pbp
	 HR7jl9w05DlpzxH5s7HwnwSVU2ldrtT43YRG5qiSVWWTAiKnlKVuB8BfMe//DKknDqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=w3JSCXNwcogBu1PJnd6LhkuPj4w6tsB9fs1YwGA31yI=;
	b=MSqef2FJrCxpjXvMkOW7DLZryC9LCxp13EIeCxwm0qodR377QXvLWjGlcxvghdz3r4yW
	 FHgPcBT1uLjqGUXHz4ssiYKqWlicPRCsoPrn2TRwiawwVgpMivK9/ss5yFeKYv/S37MHR
	 IioujIHhIWzskeewfbAGA1JuijRmUeY5tU33mlYOpyAsjmrhFCB+WQyrhKwfOP2W+bris
	 pRmFXYZ/xLfR0bBt4Jtcfy8uMZdtPvfVqtpyJRTsI3Htxh2oVlQOEHwVVJh1Y5P1EPtI/
	 xdVRSEtdAk5Cey42iMnSmxb9U4FpKmYDgWsku3L3Tv7isU4oQ4uqGo+tQIWORN/YazQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O9DHBRIP;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B223606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B223606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O9DHBRIP
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2efdc18999cso517565ad.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794965374; x=1795570174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w3JSCXNwcogBu1PJnd6LhkuPj4w6tsB9fs1YwGA31yI=;
        b=O9DHBRIPmjIqt6AhONYCYYyAxWEJ+jwHuEmk99wwjzt2Nc0YnZQ+dKRQk4BcX4Tx3/
         EAwCsCIjOfij+kfDzFdvTyjQb7+AGv+8efMSQO+env5URswiaB4hGUmHq/mLnQ/2rVeR
         InpfSAF+62jlzeryXe/PJ2gNlX/ew/8siqlyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965374; x=1795570174;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3JSCXNwcogBu1PJnd6LhkuPj4w6tsB9fs1YwGA31yI=;
        b=0ipTATQLpiebeWWTQqy3goM23UyjK7pXqTJdiHrO56i7IQQwRXQtEDLlqX1mVQW+pH
         gX4iVE7i1OT0zF8ObRTwa3q7MmeWA/8O4mweMxWWVqbc0N+bNYCIEdgQfkzwyV1w9LR8
         waITcShAwvkhaxchoTp28LOKy8KcKm+PdPnhmfzjMDVgKBX3z9S/JOiwCHVJu7/S/VLE
         SGi5uS26h/304k7uoL3LGvEAQDThaEHe9rMRNYv0sR4lxlsfqQeULcOBo+eMvgkdjiC3
         9Osy2spq5FOl7ORhpxikopXMI/3Zl+HplRhsuGQEfyePZcLi7ByIlZlOni/at/gn8J70
         BkDA==
X-Forwarded-Encrypted: i=1; AL+hErE8cCQW6ABwqkJFU28w+By3arrOlFDsWZ4J8f7SHZA+X/GFcbyfgKvALz+RcGIwkKvTRi7gb1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z+xRQMmdRcZT0XBWdAGmkka2Qu9aQsRsJjN0VXOiJQMmU8Myo
	/sQSEqMoMeEpcC2FkUFnNKaRtCg537zlCnNf8g/dLxF+oW5PpYndx7RCThIQ3CM8Zg==
X-Gm-Gg: AZFdTZcyN8bVcjujvN5jKyzzaENYKK8RXYAEjlD0J0HNcDud4sy/WWYM9IGm7YC02pm
	/X5/j7oTuHq1xAucV5Qayzcyri2BdNlx9BqPZ19rut9rL3PUoYXAQ4E8SKkjf62C9VSx7cUzmU5
	cXjfnWopoycIrPSH0Y9ZLvrr2S1Scl0iMfLFZQa5ZT7eIgRlsdPigiLzns7b0kp5XgMQi0wNsq9
	dT5N1kzCeQXx0MI/QKezVwm7hBxehiFA9/uEynkYE8t2osItfI0aLksJlXI0jsLeD8xRMJLjE4R
	jzUH8gxBIzIIci3zk5HhBBoNsM8/FzwD9DjITqymiuvNsywzKfaMfMn0cQlWfdp5DYfh81uOWIJ
	CoptMx2yOfNJ5FNDKw4LD0ranjWp2mfPuVVgGRLRdt5BfUuzN3qLp7hJSQ7MLi+71TXJiNnMA6z
	ljd957WpB8dvlUFHl8ZUecRn+wLWLuIhz964obaeIxzyIQSqwF50QuiCjG3cudZW5pQM5Ys+Jb/
	sBmELJEgKfCsvEIyWzRxzJ9qMmgHcnTsS2X6q5YJReR3rGQlUCKkBycV2lV4ErV7a6gskug/uNP
	Z7ZH1i0q6g6GSijOMU0qVKBhIk05zwGAZpcjIcFZ5jxEs13ataIVsK0otcYPQ0DUsQRsfU8/mjO
	uE4Lz5w0Eb9DbtYfF
X-Received: by 2002:a17:903:3bd0:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2eff6f86b0emr15976975ad.0.1794965373725;
        Tue, 17 Nov 2026 17:29:33 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2eff5ed09b4sm4409835ad.9.2026.11.17.17.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 17:29:33 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/7] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Tue, 17 Nov 2026 17:29:29 -0800
Message-ID: <20261118012929.290499-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
In-Reply-To: <avwp1ZpVudiT1Gux@gremlin>
References: <20261116230627.3537051-1-jeffxu@chromium.org> <20261116230627.3537051-6-jeffxu@chromium.org> <avwp1ZpVudiT1Gux@gremlin>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 10:21 AM Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> This commit message is just inscrutable. It's like reading Finnegan's Wake :)
> LLMs are obscenely terrible at this stuff unfortunately.
>
> You seem to have rewritten commit messages for the other patches, could you do
> the same for this one? Thanks.
>
> > Link: https://lore.kernel.org/r/20260519-panthor-kasan-v2-1-b7384458f076@gmail.com/ [1]
> > Link: https://lore.kernel.org/r/20260521105148.5497c281@fedora/ [2]
> > Assisted-by: LLM
>
> This tag isn't used any longer! Thanks for acking LLM usage though, we prefer
> you disclose it but in the commit message or the cover letter etc.

Fair point -- looking at patch 5 again, it is way too wordy. I will
rewrite it concisely from scratch for v2, and drop the Assisted-by:
tags (keeping the note in the cover letter).

Thanks for the review!
Jeff
