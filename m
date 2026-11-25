Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646668;
	b=wVrRc9zb7rrEnL9Fvy4Y6x3MZ9rHns7VZHEyVBu4l90azOylC3SHJox8Vz4/OLqJW4Tn
	 1NuD9sUjOtqahT69NfHzh5/FSLyvQP12bL9bxoUi+Wps8Ys3BQWZeIjdXbydjC4LvUJXJ
	 +kdi5VMQy2jrtduGIeLFtthQXr5cAi+r9U7t2L/kdicN6wLXBmI2+ZYjDTgcxr1AzvoGk
	 1oCUD3x/pSxyJaHnGskrd0iPgGE6KtJ+pjfET/Ac0P+NnerFjmq/DpX564ZZzJH745fI6
	 S2ckUg1zxZecn3Fr4o6EXNl/o10Pee9wDcjgqtWSoxgG16nuig+WRWSmKbzL18tkOnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=P59oydQPeSwr+tPqd2CX+2z+DDz1Tv1MFH2M49ikoZI=;
	b=083lOuPxSp7fWa7MjZ39ha6kJ620NJsSV5i/Xbwfzk54FJparnsdIhVaOH6tD2ItVuPb
	 WGh2cKXPHy2OrhjSxnI1dasV/P6+xwMzPn+Wcl9V3x5K6UiKGGqoy1VlCGxueAAmC7eC1
	 ekSut93hSLmViGNYCywB2AGgfHCvllK0bgRAA8049uYzJTBLifpOHOwonKJLkppRf5XI/
	 BXsbc2ZK+C8qHw5ZbYahFqmsigi7cr5xR1i2aNt2A+gZlmRcRJqPF4N0pfI4neDrbewHB
	 xjtZbGV6lTbfA1PYSQuSv0p/ChJ5CiprIBmWrbPoe1jTDk4bqAefzbHduNWrUmHrR9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=f4Yjg+o5;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEEB606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DEEB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=f4Yjg+o5
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso13131433a12.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795646666; x=1796251466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P59oydQPeSwr+tPqd2CX+2z+DDz1Tv1MFH2M49ikoZI=;
        b=f4Yjg+o52InzdJNjvABjrOWkTRff21bgbNuy+Ba5P4kWOKQN6ofIQHP+Gdt1wex4C8
         EfR0NiToo92mJex+SEXg8qtF3pUBVWO2ioUbPZ+2mfyazWyZWJVM02qeRfTr/Jyi+Pui
         v5Zb2elC5wcDZ33RJDhLmLDOUczvJ2remoooUn3z6KjUpNnv9Crv7nhWUw8cLNHXmIh/
         M34YuzpFeuNN1bOYI4H+iDn0VV3UqbgsQtaZnk0GFViA1DYxm4Y30JdBsXR7zHJA/ZCh
         9jrHzV1amS4JSDrbOZwrTjkduGab76yTwe/4rRxOJN6FqjqV+k9ptCRaxYjR3sHx9VMF
         oXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795646666; x=1796251466;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P59oydQPeSwr+tPqd2CX+2z+DDz1Tv1MFH2M49ikoZI=;
        b=Sz45PCw79RLwPQQxBG4gQVgrcLjSf1kT7APx0Z6r1u9vPjejY46KiPLLXwZ2bJDayz
         4CW1XJuYlt/XZfB6/hmowLeuncvvJSEMfUDvyxi2WtUdRQ1dk8WLDXU6kqhxBjGkXGDX
         pordZpV6IdAsrVmER/oCOQyBt4/5NPAtJQ2i97tbdgYgu76NtKYdNZHtznSyH5NMoYGV
         OzH3yMHwJxiVJZU5t0onpCFWWubLUqZalUB/BbpLcsVsQuL9jWiZkD0AXPlTwT06JvAF
         aSd2EcymDCg9ESZnizPUnpSjT9V+F/5PQgsIP91LCvjk+L1pRSjgqaRoGNPsDH5vVd92
         eMFQ==
X-Forwarded-Encrypted: i=1; AL+hErGGRiSwDTHywn5nEQEKYNNMmiuAee8sLn+Wj/PsTsDwXMiFilgBAxadTqsbEn1TjoIibqS7IMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ReKEO2BeTgjoBZqtDgSgpN1Mb1bDFjxI1hukoKqls1JvhmR9f
	6L+QUlYNxRywdh4C0fp6I3XDH8TfiPXGd5oXg21+bewknnG81o8SR9sMjxIqyuphDWY=
X-Gm-Gg: AZFdTZdN3d236R34RtbBCiXciKleYOYtdoda11xzCkwaGRFfJliBaTRtqeSAV34QFfF
	Qk7DxmBFkJaEn5HdSm/84IiHk6ShjEJDHNr4e4ANhGkkYgczohg46skXtNQ0/Oixsu3w10heinz
	m6Csu7rcUU2Q+7v6D5IQIJOngmOIn+Y37VByX4jLzljnN05sktfdqb60cgZS6evnN//PglOzRUv
	N0bWKY/CnqtbfIZtCkChz76gQ10kLNubSQKlMsxGVwQgpg8xRIPdqFnM0aqf3WBX8ZnQ9qAQdhg
	3LnT4M/hy58SOwkA9cMek/a10gHyY9Nrg5Bf7qjylVdtfqBs/WF/JfjKO6R5NnNp+FMUCv3I2S2
	nGxQ04uUHzn4sU1WZUsAX8/6Jyb49taQDnuEyuy0+aOyQYvxJ0upNDp6EXsaAeX4qusoDtHJMiu
	pgFgxZBwc/hAF+0wzFIhmWC8kwWPpo1cjmIcWWLZZDBAXx54HPw2dpeMX681rDqIkDt8+Oyn4er
	usY/ws8vEpqo0MHL7g9unELs/BqL8RkdwdGVFoaNp93AG/ffSHpvGX3RybgQcfCEVGVoMNU5rBH
	2SMVxiDxUTXDO2luGRtJSIgGhQqKVoZD6MeApJklzpdka6x6u3im4/EpZw==
X-Received: by 2002:a17:907:3f18:b0:c46:9711:e30e with SMTP id a640c23a62f3a-c5131a1601amr1649414366b.29.1795646666482;
        Wed, 25 Nov 2026 14:44:26 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00232sm717202666b.12.2026.11.25.14.44.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 14:44:25 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: Tianyi Gao <tianyi@cloudflare.com>,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Paul Greenwalt <paul.greenwalt@intel.com>,
	Alice Michael <alice.michael@intel.com>,
	Eric Joyner <eric.joyner@intel.com>,
	Jesse Brandeburg <jbrandeb@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: Re: [PATCH net] ice: do not report CHECKSUM_COMPLETE when an XDP program is attached
Date: Wed, 25 Nov 2026 22:44:20 +0000
Message-ID: <20261125224421.79289-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKgT0Ueso=OQ7=GJp7m8nr90kBUp-+N6ko+Qy4e29MZv6tLQfQ@mail.gmail.com>
References: <20261121012402.84848-1-tianyi@cloudflare.com> <3adef4b4d528780bae31f2fb02d0a08bf9c8ebd5.camel@gmail.com> <CAG4wq-f18SHytDb39SdJYzRPk-dzECjH_HCSiMGAQ721Zmfomg@mail.gmail.com> <CAKgT0UeWWherBt1MDcPF7R7jxt6E_3peo8VuxrgY3JdseM-0rg@mail.gmail.com> <CAG4wq-dizUz-6GB8Aj1wRTQBOzbHbT7pX9gom+AhR=5OWSyjzw@mail.gmail.com> <CAKgT0UffmbELMsGi8HRfu62MfC9VRYZ+TMNKFjZMWJyrV4t3jw@mail.gmail.com> <CAG4wq-cG1bseTFczZTjashN75J1Jsrv=u1ccuRsY-N1kZ=SXXg@mail.gmail.com> <CAKgT0UeNyyXKARjKR4nVVxNe3UB16WuXqxSz0cf4ZvCdb9A4_Q@mail.gmail.com> <20261125090732.69233-1-tianyi@cloudflare.com> <CAKgT0UcFnSvTO6ATw76qVHYxRusTYXpRVi0_GR5QnMhhoXwXsA@mail.gmail.com> <20261125183125.25801-1-tianyi@cloudflare.com> <CAKgT0Ueso=OQ7=GJp7m8nr90kBUp-+N6ko+Qy4e29MZv6tLQfQ@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit

On Wed, 2026-11-25 at 14:02 -0800, Alexander Duyck wrote:
> The thing is once you start making modifications to the frame all that
> metadata should probably be thrown out anyway since none of it is
> really valid.

I see what you mean now. Today the kernel does the opposite in both
cases:

- When XDP changes the frame and returns XDP_PASS, the driver still
  reports the RX hints of the old frame.
- When XDP redirects a frame that it did not change, the RX hints are
  lost.

The right time to drop them should be when the frame is modified, not
whether it is redirected. I will look in this direction. Thank you,
this really hits the nail on the head.

> If anything, the path you are taking now with disabling
> CHECKSUM_COMPLETE is the opposite direction of how I would probably go
> about this.

Agreed. Once XDP has the infrastructure to pass an adjusted
CHECKSUM_COMPLETE to the driver, or to simply invalidate it once the
frame is modified, we should bring it back.

> That is why back in the day we had strongly encouraged
> people to use non-zero UDP checksum on their tunnels and had added the
> ability to convert the CHECKSUM_UNNECESSARY to CHECKSUM_COMPLETE when
> decapsulating generic UDP tunnels.

Yes, I fully agree, and thanks for the history behind it. I am glad
that UDP over IPv6 requires a non-zero checksum in most cases, and that
ice reports CHECKSUM_NONE for a zero checksum.

Thanks,
Tianyi
