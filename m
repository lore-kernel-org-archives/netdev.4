Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795411393;
	b=OpYHcuNBGz0wBv/ntciJO0P7uypMLbKD9N6fdmT0Nv5qlbXYI3DJMoh+sT6W43+uoosn
	 FfMPjE1OlQ/5NGE8jufBvdcIlHcL5YOLG1JyJmwQn2vs3TYIjO3llJyDANkSP1TpNIAT7
	 dxV6XoFBerdLNit/KNr+iB0a/9gjs/FDAmo7dAUpWEPCiEk4s90716wng7poYA1lCiYRF
	 vGNJLzNLJdHUMTLQKNAFE11SDypCtizJXPyq8E0fRnbyI5E8xLXQFzROjV0fDZVBli5G2
	 x/RvkmwL4W7MdYrAz/sLEgROVHRVdId1v4tbvrDNe35Q5zSTf97/4+CdEvnPB4WfOnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zj1KMJVaKNaumg9rUcx+XITIlfu/2H9J2RhD6HuzcNQ=;
	b=q/57Gu51Wlti0Sh8ugm6tPnEBgeamGWdE4u8rqUrsELiWLb6N2el0tUrDr8ONsh826kM
	 fGc7toArPcNxSmCVXP48eofVmJCF/lajT1lwDmzDJDYjOfmo2d+VP5aBOcoMXEiBESzhv
	 Jj+1Ha/W3szQZl/XqAgG0kkpd6JUsaDH446XNsTVtHuTWkEUm/wDx5yJUVJ69pNS9FJ/t
	 bHlzDkyObLamlxZ7mMdaJJ/AmlCqREmz7b9Zj3n0Z/zCGJ1VE4N5IN/BD4xhTNCWkc7pN
	 et4/pRvUlYL9IBoehexJUBcxsVJoOffpwN4VkflXwYlR0A8o30vScMV04aIVN5x1Uyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mwj+h2QP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D056B606A320
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D056B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mwj+h2QP
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so26313241fa.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 21:23:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795411391; cv=none;
        d=google.com; s=arc-20260327;
        b=sApfqIFSazYe7u/0SWmyrYTBIoC3jO8f9B2EVuWPRn2Bka3HXMYk5JOcjozf+fbxD2
         aTAEvB/v/5FssBxWjmmC6hzs4p7kzUhvyiFBqA9UrKqTpNhI+T6p0CAMrH8xMsvjk+yN
         PusJ4eNs+QgR1dBfhnouQ7sfrI+gsTcuMznEQnFQnJOCMlOkaEGL4OGsGlvhUAGdGq/m
         ohcDIX1+kjA60veynlO5VkmSt5zPDvSKSnNNgYA4mLD6uxI8YXg4yID1t1W1OAvy4rdc
         ywc3ykcnDZmPaZ0yFlcB9b6zHYTUaH17EFJu9aYsj9ymR1wCNiENZwkty77J0ceuAlNI
         4VJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zj1KMJVaKNaumg9rUcx+XITIlfu/2H9J2RhD6HuzcNQ=;
        fh=2Sb7tOedukz7oJya4SsB+rlZTEVzLi6md1r7BUpzbBI=;
        b=VbRdQv6HGG/7AB3X978GP00TN7sD0hI3Izy9ygB29hhiyMzMglCeixr5+rNWaWKeMb
         BHZrdCXUN7mefJIULtub5U3K87LYDbeE1Qmlc9JWy95y7AB8oGrSeJyBwdiri97Bx+Qq
         zizQbHOEKAacWbzZOKAaPnOZtPeCg96qb6FcjBx/T+RvlB7DtiHYDznL/N0YqjJzavHk
         bQ7tbnn08kHcweLhjLfKtGtU6/iL2Tjr0eN1PRlrEp8aVJdyU7Wof0ghrz+W9iZnO14R
         SbZYK1/P7QvDVpNdaSXYRapnhO4ctB1NG1+ZRzecaVrV04akxSrWm3VtjLY4BRbI/M4o
         6qHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411391; x=1796016191; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zj1KMJVaKNaumg9rUcx+XITIlfu/2H9J2RhD6HuzcNQ=;
        b=Mwj+h2QPeqw6v8be7H58zceYRBdzZKvfvq6oyrHUkdqisW9TaJtZ0tgOg8vu8BUm+U
         UGIgY+DOf/aBCpAuS7FdqHskAk5H7OoxMjs0C09FknECuTQpq94Vd5xm2Ym1rmF7rCbn
         GNCHoF1hhDNLi4QT8By+TMCzderkFrpAUFR0LoI6wO8XBa7XsXwnhZ0zp7y/qUmu8GWN
         6fMXid99IZUF7kVzgl7PkDVjCS0IDGbU+kdw/mwgLopOuFk1nIpQPLh4b0LOPHcZVJXC
         VqObrIJYOOnc4980Dbz+DGtQ6h0LLXjARtrDzNddjPsUfP59MXLzpLp9r3SpjWB8jvPC
         plpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411391; x=1796016191;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zj1KMJVaKNaumg9rUcx+XITIlfu/2H9J2RhD6HuzcNQ=;
        b=PQkixbahQXHGiTYMIfZrTDnAeurdftNvVVNttLnPc+NiLY+WoS+3SoeMfRUexTFy3k
         CuWzsUDzfn1WLuQ7lmbr8Z/mwJ59jD8jS2raIwv9SAtq5U1x66AhaLITbwlPvyPSA5Vd
         dJEyboJIXkP1WNlV+yOMDQHNOG/6RvF/PGTJ9T7zDayoxtRVHphYYRfLl6jn2k+saeYj
         020BVFfEwcOU4sOJoRQ3hs/TPzsZj59HE9UnF9TxT7Xc/wGDWJKOnNdvX1LZXx0UwdVs
         XH0JbnZvfkaX358/WTG3xZNJDCobEx8wLxpxGVBmQz4Rdsv1dxznxCPnDmBWxgm/a5LM
         ls+A==
X-Forwarded-Encrypted: i=1; AL+hErGBYqz6cf84KaYE2qaImHJf185RWeSmQhNhHNy3HEoT5WL92w4uMqvA84Cdjm0zFbignUzAKWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mLCGkuQFArFq1L+u1lu37qQwfvhjEoth5+pEpWwgyTxHiwq8F
	51tgL4nAYqexAKPFPkNsx5oddWylMZhgvIy2drkUumDdsjZ2Ae6iHT3AvYRfocBE+5Vw4Tb4Uo4
	kS5pRVdJTdE9GTQ3C8Nvy3+Q6N+0YD8U=
X-Gm-Gg: AZFdTZfzhTGF0389m8+BqB+y5Kn7PNQLV4k2sybu9Y723BalSfyr3sadVp2IHfhwkMj
	kCt7FNKb+SvtwkGF8NHTW6OCEXbe32ENJuMayNX+OxyWzO12IjCD1GQtENV+OfjezdRQ+tgZzn8
	0et8KACUiEi/32ilObSgYTXZ40CYxEiKcbk0S3ox4O++aNMLS29ydSOvg6p+lGwpABMQ+s3ZMyf
	OYTz5fYG1D90SoUgsB9fU4z86HCRdLoFt8Dye1Qhh5/DXptMwswWbLytHN20Oo2YABZJxU+BaRL
	1VePnYd+PEubXNH0MCE6GJ+aSHmKTl1hTe/2NaEeHrjhVYB4lJGyCW8+288QcnHDIYNQ/SWTbOD
	00NDQypOYed7S8BH3WBd/Me0JHBOSl3ERsXF4tniT6wL8jB5tYuANPGj3m+s=
X-Received: by 2002:a05:651c:4186:b0:3ac:efb1:6def with SMTP id
 38308e7fff4ca-3ae7f9f7df0mr23250971fa.12.1795411390729; Sun, 22 Nov 2026
 21:23:10 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106054811.281798-2-oss.patchbox@gmail.com> <add2bfe5-0d8a-4b64-a8dd-5e02be00e425@oracle.com>
In-Reply-To: <add2bfe5-0d8a-4b64-a8dd-5e02be00e425@oracle.com>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Mon, 23 Nov 2026 00:22:57 -0500
X-Gm-Features: Aa3M54o18bPzB_y6cN5ZyBXSDft40ObSb8CAiNsU_ZagFcTkH4vNqu9TTbhSp9U
Message-ID: <CAGG=RgDLSueREjeeyw09oo8ttLHN2VYUC0qEDv+HYFUrSo0LdA@mail.gmail.com>
Subject: Re: [PATCH v1] vhost-scsi: do not validate vrings during endpoint teardown
To: Mike Christie <michael.christie@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review!

On Sun, 8 Nov 2026 at 14:05, Mike Christie <michael.christie@oracle.com> wrote:
>
> Can you describe the bug a little more?
>
> If we have done vhost_scsi_set_endpoint successfully, are you saying a later
> call to vhost_scsi_clear_endpoint could fail the. vhost_vq_access_ok check
> and not teardown the endpoint?

Yes, the first case is what I meant. Sorry for not explaining the
failure path in the commit message.

Since a543346b96a1 ("vhost-scsi: reject delayed virtqueue setup"), I/O
virtqueues that are not configured when SET_ENDPOINT is called remain
without a backend.

VHOST_SET_LOG_BASE validates the new log base only for virtqueues with
a backend. Therefore, an invalid log base can be stored in an inactive
virtqueue even when the ioctl returns -EFAULT. A subsequent
CLEAR_ENDPOINT then fails vhost_vq_access_ok() and skips teardown.

I reproduced this on current mainline (8dac6df92a2e) with KASAN, with
the following sequence:

  VHOST_SET_OWNER
  VHOST_SET_FEATURES(VHOST_F_LOG_ALL)
  VHOST_SET_MEM_TABLE
  Set up vq 0, 1, and 2 only
  VHOST_SCSI_SET_ENDPOINT             -> 0
  VHOST_SET_LOG_BASE(kernel address)  -> -EFAULT
  VHOST_SCSI_CLEAR_ENDPOINT           -> -EFAULT
  close()

After close(), tpg->vhost_scsi still points to the freed vs. Linking
another LUN triggers a KASAN use-after-free in vhost_scsi_do_plug().

I also reproduced the in-flight command UAF described in the commit
message. A delayed READ completion after close() triggers KASAN in
vhost_scsi_release_cmd(). The READ has to be queued after the
VHOST_SET_LOG_BASE call, because device ioctls flush in-flight
commands.

With the patch applied, both reproductions complete without KASAN
reports, and endpoint teardown succeeds.

Without a successful SET_ENDPOINT, no command can start, so the second
scenario you mentioned is not what I meant.

I can share the reproducer and full KASAN reports if useful. I'll
include the failure sequence in v2.

Thanks
