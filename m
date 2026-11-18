Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968260;
	b=3ZLuWFq3CtkbyoU/ISXN6fqm/Bg5d8iKFvYCxJKUAdf+GQVVHWBTuOnJmqXCmKWSpvjJ
	 MQ0jKvq0zpSuxrCY6CUK34WnhXOLaE3NhJ0dt4ZHwvXlkcKqAR99u80edQykk1Zf21WUk
	 5e8gTbzVSlOJirySVSBWUGA4YynCR4Edu0Exz8fUJ2bpHxBWbVNFnnP/lKFpCV8LEAvHF
	 boqfQzrJk2k8hVM0emYre7+WvW+qBbTicLXy8n4Q15AhzjgTgMGIiQupdXWqz8sUmWlYQ
	 njtO3l6aKmuTlgM3VxTOap3PAF1qGywZlbGRKcVlrLaUOLoqm5nXw+lmBFnnkh03vIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=u3zq46NekLm0rnRE7EnHC6taGjs4cYTrxEDBUmEQrUc=;
	b=jMn1h5OsPfZft+CKzWBQZXwmqtn+5HYJlO3cUE/uMH94WNu242dYgpWM7onG4/hRJaWF
	 Gv//U8O2JskeUF0GRO16H9dTM8AhHALCz+eZh/Cc055Rd4rHPgh2coKIgF+sJHSmfwxN+
	 QgLvnC4YQ5cVBtLhhVQhZ5rHnI1L8JFSJqOxVFfOvQuuI7b7bEHzPUqy4omTY59B2uWJP
	 fHGFU+SXUC3Qqly5YbbUeuXxsaaT+FwPlhFGBAjbm9CyOGd/1B1vX7BGFj/a3hJDHuRzm
	 NxbQk1qQhwtxnZn/bWeR/KeWPmnK0ZcdjQc0Phyik+On99TrOV4wY1cssQBPnwsi+BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZkTvKvm1;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3D0606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB3D0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZkTvKvm1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so328798a12.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794968259; x=1795573059; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3zq46NekLm0rnRE7EnHC6taGjs4cYTrxEDBUmEQrUc=;
        b=ZkTvKvm1rMMk5zqcfqPID8WwrkwGWAl9Eapq1UmUFb2WZbh5UiRoS3es43K6iE2jEl
         dmysshDJ3kqm2A1kyE80zxmrX16ks+LymUnpDI5cEejxlz/pPr1OTnkrh9i3rmQqhayo
         wFuFdRYrNkzoneg6tt4VyDW/bCKgNCVsbetQS3dwTpRMgziJReNRnfizRC1OxGwZqYtp
         QepEMjQFxgxbhFp+RZjBWdnGmEMfXc2mcK9lT6ihyDOIxKznX9pC0863534SU5NQW/So
         5aXEJBBUcHx0XPU2/FSB/2vY8MB6y1TVrjC0fixTJf6Y5FgDsbXpoCg7ungrniOK5nHF
         nZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968259; x=1795573059;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3zq46NekLm0rnRE7EnHC6taGjs4cYTrxEDBUmEQrUc=;
        b=zyzxlcOA1mK6YYnlzQxmQQKyOzuO51taqZl4OzukzkJ/kpVEtY+NZWywVZH7Q84fBQ
         cmDT5VzYIEhF2zVPnL9YtKdE2MREeomzgRFnK44k6y03DoJSzwRRmuEtO1ycDAFDil1V
         FyuQTTE3N1o+KaOYaLhlAG1mf6ztDXSSMaEyOgrjAL/N8Yn/Nm61QVyqR62ouMfYvKt0
         LJ9gfEfAKrrsUieOrRr0vZo3thW1sqG1bbuuw5vtgJ1UO71Z1P92ZWy0aXox3MaynXh+
         UUzq1tLmDDZn56bBB/6w3uniYsaB9arUNTIG2nJ4LlL5X9j7dbhl0IsEEDDmlPYPo2jh
         RQ6A==
X-Forwarded-Encrypted: i=1; AL+hErFIfXF65E/yWOQbhjCUIy66S5JXMK4wDlzmOdTvp/VjzJ2ZEvVf5wPRtb30c4jNVlnH5FbuWP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uBz3EXLVOi4Ckp9/1SaMPnfTUtwhbV+c21LzvnPYpSKJGgVRM
	xcjUohqcar0M91IdrwtLRbCrpE8afNKx7EIk1voaIvy5ECuuzGz9DVTeIkQ7vJh7RHYqyjDvi7X
	GkpgcLw==
X-Received: from pgfv18-n1.prod.google.com ([2002:a05:6a02:8752:10b0:cc7:b626:d7f3])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:95:b0:3f9:a6b6:e173
 with SMTP id adf61e73a8af0-3fe89a0fc34mr1234614637.26.1794968258882; Tue, 17
 Nov 2026 18:17:38 -0800 (PST)
Date: Wed, 18 Nov 2026 02:17:38 +0000
In-Reply-To: <20261117-work-net-peerpidfd_short_optlen-v1-2-a93f56288501@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117-work-net-peerpidfd_short_optlen-v1-0-a93f56288501@kernel.org>
 <20261117-work-net-peerpidfd_short_optlen-v1-2-a93f56288501@kernel.org>
Message-ID: <av0Kt6neQbnIJpp7@google.com>
Subject: Re: [PATCH net 2/2] selftests/net: check that a short SO_PEERPIDFD
 optlen fails
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, netdev@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, 17 Nov 2026 16:25:31 +0100, Christian Brauner wrote:
> Cover SO_PEERPIDFD and SO_PEERPIDFD_THREAD with an optlen of 0 to 3:
> 
> - getsockopt() fails with EINVAL
> - optlen and the buffer stay untouched
> - no pidfd is installed in the file descriptor table
> 
> Check that a full-sized buffer still gets a pidfd.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
