Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053894;
	b=Z2mEA8xhUuBkcKTbzzDFPzTBgPJQvuTeMbg0QziFsUILKD1TWzuODc6JFUtQ9s1IqYeZ
	 L+2xK39Jj94liAMlU+FdpOj1MB3piVp/khZSll6ySFEHYMJ1aRnp+/mUgu2W8TKo9dftz
	 2xWh/evZDSdxvgG/JKOQAWBc+NTG0xiFzKcB1YCq6Gy2BgHSlIOqOyW6LeoK2xxtUzBtx
	 nAzElGhprIviXZ592+GmeifAgV806/cY0AlQxeVWiDpZ8iq4jRk9aewmzvP/xNQCHeF1e
	 CmjkyjpFcH4ZpMQsXC8mCIaGBFasL7QBBQVUuGoo/KGAyhm7eL7FAP2jpbMzFYhAZSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kC+uhz3Afjp9Cqz8zh23wNboDVMQQa75pZ1niNRa9cE=;
	b=d1zjQ7fPyDgNANL+CYGM8jiTqA5hIlb6+S8A85aWwuC2JujRd9U9kX3IypGwdOfU1p/o
	 qJOaWUQwHp+27Bjnnm33FVKnP5zwdigxv2RPqEoYTeiNK6xAgVvT58wGBKKzV0L5TqeES
	 8TqIb7bXJp83SzcTUTWVfhmNXMUrTvUbq5PK7ORgRQvs//yiV6MrJGG1qd1NII1IOuPQ2
	 3+qQa0y6WXiRYSIKYiS6wCY+1uDzAEWUaTpL8Rn9mmcSIY5yHUDkHiP9svx6qutU01jrM
	 wvCiR5zhzF30afbbckUXUl/HLPZVhVqrTBMEZ4AgjzE/smFmXrQhn7CINmvlF4rqCsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YodJU3G6;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C8B606A333
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C8B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YodJU3G6
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so132221a91.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795053893; x=1795658693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kC+uhz3Afjp9Cqz8zh23wNboDVMQQa75pZ1niNRa9cE=;
        b=YodJU3G6HOVaHj6WeDt5Y4UHHP2vfW9vVNUgTmANxu80UmKCDlelZ4zcRR33L8Jm2K
         VswI4nIIqlVSIxBF0tdChGfztska8+jRizlCyMVGMW6uzwjEUVtNom2NNrBrrNNu/FsZ
         yQjf+rFOh5JWBC4KwmazJkkyKrtf0xGwBmIEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053893; x=1795658693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kC+uhz3Afjp9Cqz8zh23wNboDVMQQa75pZ1niNRa9cE=;
        b=ppDEYL30cwPAWxZXLkyDwZV0Oo/ylWYWisGpIqIHu4Lsj3WmtCPM0jn9My1Tz3Fv0y
         5MOfa5meL4h98dZMQlMKR8XFB9W9LrzXnJTkxDJLM/RNQ7CdotnZaYCAgyFm8GVBLx8R
         chEIDb8zi1AmqRBSi4aiqUzx8oMGpNfg5PsiGZ4Blgw1TpsvorseSk6kp4C9awzFl6vp
         6cFAfdrD5mc6Ke/9VQI6HXk9FmoYb9s4M8Qk0u31r1M9c5jzOGG9f3ZNQy6K3DbN5SsD
         LwVl6pVx8fRLnBehNpcSUueBpH8httWoIlZHZRz+Jq7EauWf7lo55wbcqrT3CNFwyPso
         z37A==
X-Forwarded-Encrypted: i=1; AL+hErHRznSHmLtBiN2FNvqtn2mIAVVL0hoVuoXvvJu8p5VrN5KJjOgUWgnbXpK1QLxm0inRefl233U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LZfIezPcssu4LbRVtgZ5rQJ5+uP9dLItxNEgDf50eNpSoZNhn
	h4c34qcA4Hp30jLWL2C8shqdyOQTiNf77aIXeVVNbFHqevciPMOJ6WDxHvv6T/Uizw==
X-Gm-Gg: AZFdTZdu7/SrLR9IX9PzeD3LsvMmlKkAIW5XWuYRg6Ko0kgiYytopJobFbwY69KujY5
	wXdwMnAk+xtaHXxp/4oPzbKoAhmjcHCquAOSk4ibcpARUqYqDPmHdso5XNgvrftI3E5p3fNArHv
	vFvC76dwLM7WNrllyyaa6DbsDuA7JH2qe/IzW3Fqlas+x8p12tN+iJB1dM4FbaLhUGx4Gc2L2iu
	lgTp39OOLJexhSfmAaUjQre85763h4wrD/JJNhC50N4oaqZPH+REVM3HFQ67tKE1FZrXrB/U7iZ
	WIPqpu9jtTtUoy1d+l1pFZw+FxP57IXv3OseJI7UR7P7W3dQ7GzcHjwDHRFuQDdGS3mLjQAM7uP
	N9/7iWQOHmFh4Yc7Ze5FFW3syjjZyoEKlOuzmAZcHk0cF5Eny+6hOcc2mPriHZLKoxKkb/S41VA
	AcaLPrmb0pZTPvqiy3gR+f2600YbuYEMLPdFrFkLTD16l6klQhC6iCjpirydzhcisckt6mtd8fo
	cU91gPl8kOCsq+o9KTowd54eJIgcS3zoYFyfxoAutMNOQ4kPDZB9D5j6ADzdAAJ2IU9KTpr7fdb
	jxmo4piMX673h7rfg7WEoCsOwwRTnRMp/YZxQpeWpExf+d9R/gkvfX0bCu0sJVCm/mK2WQ==
X-Received: by 2002:a17:90b:2805:b0:3b3:c92e:f523 with SMTP id 98e67ed59e1d1-3b3d0764320mr7560562a91.3.1795053893354;
        Wed, 18 Nov 2026 18:04:53 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b3fe0e5bd4sm772079a91.17.2026.11.18.18.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 18:04:52 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: David Hildenbrand <david@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
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
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
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
Subject: Re: [PATCH v1 0/7] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Wed, 18 Nov 2026 18:04:45 -0800
Message-ID: <20261119020445.1096831-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <332f315d-ea27-488a-9a3c-28cdfdcd5f27@kernel.org>
References: <20261116230627.3537051-1-jeffxu@chromium.org> <2066d131-f999-4747-beb8-520d5e0ce1db@kernel.org> <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com> <20261118012858.289236-1-jeffxu@chromium.org> <332f315d-ea27-488a-9a3c-28cdfdcd5f27@kernel.org>
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

On Wed, Nov 18, 2026 at 10:46 AM David Hildenbrand (Arm) <david@kernel.org> wrote:
> > 1) Simply keep those 4 cases under GFP_HIGHUSER (drop patches 1-4 and
> >    7), reducing the series to just the GFP_HIGHUSER change and its KUnit
> >    test.
>
> That's what I would look into first.

Thanks David. I'll wait a few days in case there is more feedback, for
example from the KASAN side, and then send v2 with approach (1).

Jeff
