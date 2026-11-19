Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073183;
	b=1W6kWYmA5ruJWVYN1PsJlen/fdrYbspV610UouKW4prLWexL6fv/gzU22A+oPsssm8gw
	 jgYqkFGUzm4fZ97v7f4hjf4jJEodMjGPgSNCHRrqTIdms431p5E+kBCKTTVj6JWBDWCxs
	 0Xtgf1guCQXVMe3a7GM/1vR17ZN3mZ0dRh27haOHi1hIJdvpZBwhUv5Ou8g1TaiyMwo54
	 W2DPBD/VyyKKnUK2Tr8FRLl2XI7xREfkBNsJDk+EAGdPYOvcYmmYAeostV1ROqxbsCxzG
	 PFE9tpg3P2f+wLkilIVznQRUA0Mqq0oXeYXrSBhRP1Tr6IpnsUVxESqNIZQMAulVfFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073183;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition:X-Mutt-Fcc;
	bh=3j6KmbtXLvsmTJiTThzFS5hiEYdNxo/Fgv8rfbB+Ypg=;
	b=vmfFwr6knAEcrV8OyWh+p6rPrlZN+HTV07ato+qRIbjxR3GBbJvqXPMlla8cnIb84Pfj
	 +nVrwjtqw5ePgkI7Uv6NrCRILHFLXn6nwnvXLmYBN+SCicZ8rFgGQfp3y5hzbDwLtLvfq
	 /qwr5BwOFWsecLfJbbTNYZZ95WxGrfskKZqZ01D8Jew6CCwWqioBdjiviACY1JS5+26wZ
	 m3GT695W4II8w1LmaiYnf9gDGgmACMqsdLyojWYp71eP/84Dzb650mHlS5874oaA9QSsy
	 +wylJFqY4yaWX1X1O/VakSslwjwHjyYEeGs4wtIdFHmW9fB7K3fk2CIqJ1LotKJBaVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gdeH2uDW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=F7rRIAyt;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CDF606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CDF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gdeH2uDW;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=F7rRIAyt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795073181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=3j6KmbtXLvsmTJiTThzFS5hiEYdNxo/Fgv8rfbB+Ypg=;
	b=gdeH2uDWu8itjh6NHKhUx86u22inkN6eOj7JOIjIaOssT3k1IbkiGiHmooIpkV52lt2ldj
	kFDpVwUGei0XCR3OCPyQQrtAHdDTQM8yji8S4ngIneTCHttdtOFBnelgx1J2LjKpyq6IEi
	1K1RPS8s57f7KLUCUurBdEOQ0rFvmWg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-EFVJd4nLM9i0pAJhrD8Qnw-1; Thu, 19 Nov 2026 02:26:20 -0500
X-MC-Unique: EFVJd4nLM9i0pAJhrD8Qnw-1
X-Mimecast-MFC-AGG-ID: EFVJd4nLM9i0pAJhrD8Qnw_1795073179
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a3705ea6ccso573493f8f.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795073179; x=1795677979; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3j6KmbtXLvsmTJiTThzFS5hiEYdNxo/Fgv8rfbB+Ypg=;
        b=F7rRIAyt3wWCkr/uIq7CcsZAeA9N2ckYQaSb9PfrHzzdrhLoatK0jPKUtp+a7bx4zw
         Ke1VCtmj7C1COq4SH1DMhKo2Ccl9K7tOI42jExCQFi7YHv1F+j0DeQnYLHFOJllMVk5T
         t2Hal6qIZufy2ggOPnNvB12f4qax7PvUPO5vOts5DVv1q8s8jnGomTr9maN07NLHj81v
         GsL59um+fiT/322vCvC1fsnbBl1QmFpLuvWWvkOEpUPm4fWEQ51aFMUTyFQ7v0lGn2U6
         ZCM/9e2zx93L7vZkG4kMo77jDjMqrJlJiTu6EWtXGU/v1melySXVeVmdbJPyQnN6s+gP
         LWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073179; x=1795677979;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3j6KmbtXLvsmTJiTThzFS5hiEYdNxo/Fgv8rfbB+Ypg=;
        b=EYYjLgVK753lz1SIVqdLGHEJXnETLTrlX/PCrk3DJZNbscrra8ZjYWIs7DxsKRYVPr
         GbrPGVP7RDjjs/Xe+SLr6+s+pE7ZK7kp7tsLzUV9TQoog3yiwbeuf+QBph/DXVZsZXcj
         pd/E3wIuPq2VEirEJ4CH4j5hnGydSNHrKDlvayYF6UuENDyG6fYVnYN+mpJL3TNfI1pR
         7f4VwjChDRjMCtZE+aS32BcVSISqECldYW7HPQ5VQI05/7NDi9YqMmWeihacTbUYY8Ie
         Gzj1NWw8drV3gE1bMpbL0E82BBhdKGa8kJ9EhvQI+8ggs1EKzGTgH8BnLz46KS6JwxNT
         Z+mw==
X-Forwarded-Encrypted: i=1; AL+hErEF9W01Vl4sSt0w/1KYB4XwZvbWqbjUMhRtqI/pLuzq/HV2z4ZFd2YPfOSZ970Ny2eRo6SMoGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rlYh0SX9/NPuTsbQHMQSPak66+gFPUmf75Q9f4TrWaP3dTXSr
	rTU2+xMw9oDWq/bIrqfR6LK8nLQh2AytklN/Sk9ZYEZtOjVYgMfkoPByW0sxFXfPgRbqf7u70k+
	BpEogTuJw3dxfkVf4QTAOfMLWyzQSmVLiKdsiX8KfK+NHmz8c91jEWnXRng==
X-Gm-Gg: AZFdTZe7Y+UFLqm7+A1A+IeK8i1rUfCk9cN91HHA+IyUFWFgbQ3GeabaJNAwnGbPod6
	KYPr6pYZlxGoJ++Sy1HCHRJjhGqupB1HL6Oh2F1u+Qr4OSFWTJMpFjl4hf52jGfXlv9cS4eEd7s
	zgbfJwpQqpOU1S4y50X57hH0qjEPxzP/1sv3TxZ3OvehtbR7U6vcVLg9q7mstagxLCoAK1UkLma
	QeG+rcvaFxKDhz4g7GNvYotY8C5WCEGPPabclJezVSPymyqGT8nn1hrxZWyPFrxrMC4Ii/GlvnV
	VYdDAPbgE2iL+HLRpXUdrqWpRuGCOmSaBJcRwbTeKUwBGFFU0g8NJo8TmcbLT7hNUOxvQkYrH2P
	+2suI5LunOItGnEn/BkaYvcGZfyrCIZn7bNzI81di0BY=
X-Received: by 2002:a05:6000:4703:b0:4a6:4f35:336b with SMTP id ffacd0b85a97d-4a64f353379mr8871400f8f.5.1795073178850;
        Wed, 18 Nov 2026 23:26:18 -0800 (PST)
X-Received: by 2002:a05:6000:4703:b0:4a6:4f35:336b with SMTP id ffacd0b85a97d-4a64f353379mr8871351f8f.5.1795073178254;
        Wed, 18 Nov 2026 23:26:18 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3f7sm9540259f8f.24.2026.11.18.23.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:26:17 -0800 (PST)
Date: Thu, 19 Nov 2026 02:26:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	bioloidgp@gmail.com, jasowangio@gmail.com, minki@morningstarsec.dev,
	mst@redhat.com, stable@vger.kernel.org
Subject: [GIT PULL] vhost: bugfix
Message-ID: <20261119022615-mutt-send-email-mst@kernel.org>
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
X-Mutt-Fcc: =sent

The following changes since commit 1a577f9402c1780cc1e663f48d5dd54c02051b09:

  virtio_pci: don't take the MSI mutex under cpu_hotplug_lock (2026-11-03 07:32:14 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 5570a998b884c988dbe105430d7e2d8e9411e37e:

  vhost: split out-of-order used ring batches at every wrap (2026-11-12 07:44:36 -0500)

----------------------------------------------------------------
vhost: bugfix

One bugfix here. I am testing a couple more

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Michael S. Tsirkin (1):
      vhost: split out-of-order used ring batches at every wrap

 drivers/vhost/vhost.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

