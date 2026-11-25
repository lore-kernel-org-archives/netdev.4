Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613982;
	b=brEqJpse95PDdhT85gItJCvwKLVciX6ZCc5uo1bcDQRuNJzroU+sksgiwDt8UlSog7AC
	 oL5cu5x4hDpI1MAG6wPngA46tAHPVmSW5BrZxXFI0Ez+wYfU8IUUvKsAl1odsNP5a261N
	 0n1F+IsCtX0+CE6z25noMmSdV+4fPFgNHAyJS9qrPdBaMN8IiK8DUeP9Nft0G5laqdKzd
	 T7UTlcGOGMEiz0tXS8ZEMw0r7zjWoR3dQoSXVm+teNkcojJ1XkxxbBYm41jE53uz43baI
	 HNy+wtyVe1yWsG7mf/RL2DHBFVV7UJpKj6bxLuHqVBiMouZb5I+9m33sNuFXfYak6Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=k0XLbZ5M9INRCrfgtQEgGkLYc24AmJcFIXjSp0f6z04=;
	b=MZrLhCTgz5HOMV4mNb3OJpC0ZL8B1K8uaqcYvMw4dlQNSfS9V0c+xaNBokwHPpfbYw67
	 kiEn3Rdsbnu+K2Bx2MM8Xk620TAA6DlI3VCp3P5EhH0XTeClR2al1um2PfaiOdWWqcinx
	 klg2OJnktBb4S3DauFmotqjquQo6R/LATpBsO4tN5mnxyOi4WfZ8Qzx2xFZ8xUjdFS01C
	 dbn/vGeRXOjbH2p93d7LrEL3oYyQopiNwHOSJYBXO6BlN/1dqkUHe1JRQdVMjw2/HFz+O
	 ZtMu4cgNoYC6+WrRukAsaD+6Xji5zwTwTCvgndbHZAEg239gADceR11EaeQa5YfsHIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=b8jVcM96;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE18606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE18606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=b8jVcM96
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso83555766b.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795613980; x=1796218780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k0XLbZ5M9INRCrfgtQEgGkLYc24AmJcFIXjSp0f6z04=;
        b=b8jVcM96WIRlFvvBHc3+t3GHIXAgTbrYHlwqEgANzhaRJM8KHUJQGkjKek2GweDfkK
         fWV46dAdq6qkDaSKG3wQCsGoLgw3QsPLD624iaVSbQzlJeVXVxU+hR2CjAhXGCY9IZO4
         YnOJID7TPw7IBqn0ckWnQzsQSW80ryS+x7JM6O2zCJ+1NlsxbhENIrSYBd+Lkoekexk4
         GJZtkmyE61wklfzreOoyMUTIoq9C7cmJbH/JPb4ltHO0SgxUlaz+A7BixBhOD2SsI0pd
         ti9mEfop5VOVc6MT3VnnGwZoJBzkfX8iAPcQwi0iu1oGEV+8dst2R3P+f73hPETqBqMl
         i9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613980; x=1796218780;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0XLbZ5M9INRCrfgtQEgGkLYc24AmJcFIXjSp0f6z04=;
        b=jOdp8JtDNzTGeBU+zUr8XeYYwHWZWqTAqtJTyh+/7v0L5V5qpmdCLnJVWujnWppR+D
         nU05lQk4+LmIQxonHFFT1VUX2Tn79y5UlMPXamEynsFiNBnl6rw/KbTlK6kbEJear3xU
         POxaBGF8mBRYLDCDOXtZRR96GyxqJ3wb3C48cjfgBA1GydB8OuGD056Ah04fm11lEz8v
         jbGEUY4ukMd6bCOHOueigjCSZo/o8+lgnmOj9+LoRlMJbLV/905AJHeyFFud4a9nEv7v
         CH9S0yKJiRmmXxM8DwpjHRBMQcFhky6dklzJKhhGNRlasLD6YUJsR5fhCKfzurw9XrOs
         0qHQ==
X-Gm-Message-State: APuU4Z9iWsleTV2tsbDy9T4E83+Dl5fzRRi9GDtjrFQ7qxT0wXjtngjQ
	+aDHv6qrv8X9dXNaXSHP0dguc86qQKl35j5U0NYjW8UX10I/bcelbX42LqGYBTHnJ7E=
X-Gm-Gg: AZFdTZfp3XzKYrp7Yg6aeCU6wN6Ke/l56OCMCrzDbyJ1kc3r0FWtbhPfdUD6nuVv0TX
	ODxKoFYiaXRZmtrEQRNAmMxJsMqn1vo+H9hGMlfwLQNbCOAALDQtMAcxiNcQ9gMwa9UzFrhAeEM
	cXVcXrR/EkaKlTp6v7vRtn6J6ZQqmWomk0oGi4Nv/t6kI9CQqJve47F0lf1L0wwrxcoWrf16XMc
	9fjznG0ehQltIS6D4UtwWHiNLC2G1hy05CAmxcqDOkkc2xQ5A1ev9wFBsV/1kEcmXvmjsiJBZ/K
	SIHEUUGRt/Od+8IB77qkw39J+mx+/hJVpXPSS3yFS4qsRfYO3YfGT2D8Q5lyRpTIcMlSGNc26IT
	tpUCTOlkPLNPhMnNPk34rclO4Uedgef7+0ReaJmHwZhRAw2oTzQrmcGK/BpEEKTSL5Jsuq3E7Vr
	IkMcbucd30dHdolvIFGtlA+A06MJjLn9Bgtgmp0ktlPE1gwa9WZb1cymt4zeaLPEjg+20thKcS0
	3cdogvIryuXNjZ2rEIxyETB0Kxf5WP9f9qOKQ73eL1CxMuZvYOjEKvxvKOnHzQlIU2Dq11XUtbc
	8MmmQCQW258acXkpB7FikcKmLB8F1/Cya5BVLMtvuKrhx60=
X-Received: by 2002:a17:907:6ea9:b0:c46:a5bb:5740 with SMTP id a640c23a62f3a-c513a3a656cmr1605152966b.5.1795613980473;
        Wed, 25 Nov 2026 05:39:40 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae679e3sm637401166b.22.2026.11.25.05.39.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 05:39:40 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: netdev@vger.kernel.org,
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
	Alexander Duyck <alexander.duyck@gmail.com>,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net v2] ice: do not report CHECKSUM_COMPLETE when an XDP program is attached
Date: Wed, 25 Nov 2026 13:39:35 +0000
Message-ID: <20261125133935.36695-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <awbGK9v4k3Fh4U+H@boxer>
References: <20261125095201.98279-1-tianyi@cloudflare.com> <awbGK9v4k3Fh4U+H@boxer>
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

On Wed, 2026-11-25 at 12:27 +0100, Maciej Fijalkowski wrote:
> My ack was meant to say: let us get the behavior aligned to mlx5 and given
> that there is pending work regarding checksum capabilities in XDP,
> Alexander's concerns are meant to be addressed at -next kernel candidates.

Thanks for clarifying, and sorry for dropping it. I was not sure if the
ack still applied after the change moved to the control path. The
behavior in v2 is the same as in v1, aligned to mlx5. If you are fine
with v2, could you send your Acked-by again, or could I just bring it
back if there is a v3?

> If code has changed *so much* why have you kept the Suggested-by tag from
> Jesse?

The Suggested-by tag is mainly about what to fix rather than the code.
But Jesse and I also discussed the code itself before I sent v1 and v2,
so I kept it.

Thanks,
Tianyi
