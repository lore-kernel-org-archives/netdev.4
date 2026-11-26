Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683933;
	b=dRL/eyynRXGLLV+33MocSpvluWSGOLoolA6ktqO/nzDaf99GyaUSewRWWcnABKMJnR43
	 gtKZXEgkS2lz6Qyf9pitpQOYqy2G6nqJQ0RwyaLNJcp+0MwyS9htiYjAxk/lxt8SPAgtZ
	 nmqN0/b1uSVGaMqWjJ/zxlPw8yLOtA3xFU7siLlJgSRelswTcJYot269/ldexRw9U23uC
	 phSWqDAgLLqQdGCf9ApRbmt9nigQG5LFwm8OuIL1LRiGA84mi+KnJ3gNDw4OsCkR8j2cR
	 0J3dZYOLRvewrVIyd1ls7DqdegzLjic/Sjg5Uv47ASh/7EOXithChtoaJXafXL4Fv0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683933;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=x3mNmU+WFFyqEshPvtKG6cWeVGoNCyVD5C6NRtN8mVY=;
	b=XzgaJZhiEROeiJuDhFVLiFS6U/qPnGes24W3Vf8wm7p7rXZ4YQC3A+uOxV/Os+z/tRT1
	 oj34OtcYje0cyjm9zwAsBy7S/yk/sBJ6dKUwTlng7SmCb3NpNdvdcvdRKQX7Zwu/aXNHW
	 CSE0rrmSejg8siXG0d+abtra7l6FJFOWTEbLCtwHH/BCXu8adqpmtCA0byOs5/fCGjll9
	 LQfrwjodjCoAx+4lfTblVjY/hyHkJiyKGwiHq8sNkl8mucpEYx0hHLQiyAsailvOJ0ZMQ
	 oGFH+4QhrspwODY2dYGzfxZeHbrHe7tY+H6c73METBK31nImPLw+JM3oW6Wz1yoFJFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GxrB4iCl;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8E606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GxrB4iCl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795683931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x3mNmU+WFFyqEshPvtKG6cWeVGoNCyVD5C6NRtN8mVY=;
	b=GxrB4iClRlu8kUvLvYlB28WHLHpKwHnspc7mm96/EPu2eVwABJyIuKY2xFnveoljXW8Z6J
	ubIBlNs/KSfwDG9B6azdZShdi5Bcv3g48L4fG40TXycPdQrBu0v//XKbLxIF1kpDptF77o
	ftcdGuGP9YIUYD7UMvzCyl61X5yWav0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-426-UOfO1zRrOVqYiqv9VFjSvQ-1; Thu,
 26 Nov 2026 09:05:26 +0000
X-MC-Unique: UOfO1zRrOVqYiqv9VFjSvQ-1
X-Mimecast-MFC-AGG-ID: UOfO1zRrOVqYiqv9VFjSvQ_1795683925
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 749C119560B3;
	Thu, 26 Nov 2026 09:05:24 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E8B73436;
	Thu, 26 Nov 2026 09:05:21 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Ivan Vecera <ivecera@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>
Subject: [PATCH iproute2-next 0/3] dpll: add missing type and capability names
Date: Thu, 26 Nov 2026 10:05:09 +0100
Message-ID: <20261126090516.4278-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

The kernel has three dpll uapi values that the tool does not know yet.
DPLL_PIN_TYPE_INT_NCO is the type of the virtual pin that switches a
zl3073x DPLL into NCO mode. DPLL_TYPE_GENERIC is the device type of
DPLLs that are neither PPS nor EEC, and ice registers such devices.
DPLL_PIN_CAPABILITIES_STATE_CONNECTED_OVERRIDE marks pins that can be
connected while their device is in automatic mode. All three are
already in the uapi header of iproute2. The tool prints such pins and
devices with "type: unknown", refuses the two type names as filters and
as id-get arguments, and leaves the capability out of its output.

Each patch adds one of the names to the tool and the man page. The two
type patches add it to the bash completion as well.

Petr Oros (3):
  dpll: add the int-nco pin type
  dpll: add the generic device type
  dpll: add the state-connected-override pin capability

 bash-completion/dpll |  8 ++++----
 dpll/dpll.c          | 22 +++++++++++++++++-----
 man/man8/dpll.8      | 22 +++++++++++++++-------
 3 files changed, 36 insertions(+), 16 deletions(-)

-- 
2.56.1

