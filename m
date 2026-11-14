Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686762;
	b=quWTWaktcGiofnZTnib7tc/4JWtYUhR2NdE5nloVatHl0O/EemyQ0uTCs45gRxMBZi8L
	 SXu3FM9m4yYf1v8mWlmk9LSa1g2LcEvunbz22A1vCm/GIuLZEIm8vFAyNvo3kU55euQwy
	 HBSsNS8EJ4xozwtf6MPI8s69N+W0EUXPLaw3wZFWen9VM2bi54M4frYAzmbWs4PfFV7JT
	 cm25BXZlWCEsXH+G0TriJiPxE4jI/PD2dyG2OM0smkP+JAAV9gO9BikTFEcvTp45A7Do8
	 2ZRGdKqvi++RoQrXD8DGyc4arRu29NA8CK2r0AMXE9ulaf22EQescZVhDljX6Rf3dSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
	b=E5gUwLh0uwC0JU7gWyF1eaBnoZ/77B1q4nEvNiKi67sv6Vnenw7yPenKM01sdUX4+ZJV
	 pBRMA6ZbI7erpndmgh9T7zFAbuw/9ZSI9p9xdZTFyICZ5CtwN7wEAe+qYrm+GsNXcSzzm
	 Ntfyr4SK8hPW3wBjsmrvAC5Y0rf6S4CfiYg3uuFItGFNXtgUJ7XFJRlk0zkHKY6kcLqvZ
	 z/gqUOF0PaYesEYNauvrucXA7vP4SGwvYMLrb9FQUb1Qf8OCNYYemDeEbiwnUMtImNUS2
	 tK/HaegVznEdVcXqZYnk47SjyTnIfb9FfyJ4zCyYPWcprUD2n9rrJtXfK7hKoF9LONg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=WyNKKpAN;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA30160A3809
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA30160A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=WyNKKpAN
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc758830601so2488359a12.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686761; x=1795291561; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=WyNKKpANsG5sdrHWGAt+Y38DvSIGt+WnCUyNYCZoBM4YbSq3wCVAHI95jQ8BFTGgLn
         +vM7af/q0i5zrzjZXXnriwzXN4L/RbeBg/iztvO0eyeIXYNiQp/OYlS5LD9yZqr2gKgm
         1I+5A88e/cV4J0nLZfgp0f7sQwj9jY0Q4quBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686761; x=1795291561;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=h1pUWJdzCA3YGnncdC9td+jKY1u2bPxQgFYplaPyJZrI2HydkUM6A82HO9164JatbZ
         xmzhbYxD1g29TeoWx5at9Zz5YOqIHrqtYsVNU5TT2FsPpPYL2ijHT4xEtcomO3UUhfsL
         GBaCHE4CtwSqn9j/2LqrX2YL6g57D7OcKjIJn2y8Z/slhTA9DhayXAqHmjZ4s9dB1z9e
         CDlsgC4K9W7LzRRPSzrOy6JOke6uceZxGshhKvAZ9v9S0DL9xcJkE2+pd4eFf0VB8iCZ
         H0tetpxuwWJSgvSWrWe8Rv0S3h749R8aglj4cJefY5MlQVxH3iYb94AycsnrMD7izX7G
         LzeQ==
X-Forwarded-Encrypted: i=1; AL+hErFuiin4c8FCqL0eBfwTwYKVoDIMNTTmfcc7ZxMt0+dPen7cAoL8CTD5V8514/0G1MsqmtHL3fo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hwFnMWuwi93uXo2y4vA08I9flLHF7RaNPsTxSfkowOdrk9jZ9
	tKjX1Zg4J7XwMz5+1jA6m/i3FTA5+tZc8IR8vbEaIbzrT0HImDPY1I/UTdA0Cc26GoI=
X-Gm-Gg: AYBFou24xi3RxLe39HB9xEHnAhBlh4B6iyNpK0Kv/DI254imuLAikfV976bcHBw3H6K
	cMRzEahxTC7dCzlctzbOOK//NmKNclG4wjh1N5ChbXr7u/IBqCFTMRtKzD4SJU7PluABlNISW1q
	x72KRQyEV3hisAQd5Dz/XJ2EDp3uHOHiKFxx7gKFhxvMxy3v6KIaAZ614x/9t69eUvYQGJdxjJL
	sLCzS/3pz6uwcd7iMbWIFySrL+F9UEg0OKgzopMiYuGk+CGxz6nmjuJaZOfmBuTQMXXydPvrcEB
	QwR1+/3K2KmR0OraQX1rFHEFNWwXH/YNkbgzDZeiaaMuy71OezdMoWK2PZDAKz2l4QAdSJKMgn+
	UBzDORnVPd5FpSUFjaNcAfk4ZmH4WAQP0oWc1zYjCvF6wzKBWU2uM+Qnj2zFejzchYHsQLJCu6I
	iRpdsaBVBkOC17VefrMewaaSKjS6RnmL8V5gmTPu8Z+Cf6nlwhoN9K8auI3+aZgmdBmSp8l48DR
	SpJaoc9XTC0aoNN8+XWswFkbzoGBomXJ5Xz+tt8ZQ5vGE7uMpihNEja0TMFbp/nliBPn0iTF02C
	QAjbeGgt52dtG4N5KChqFgLcVYFNBTAftrFwBxBjwPUT9+ENlFe5zYEvl71IjDVIE3xnZ429WUi
	UgI9lB9+UmnwkvZtLSGyyj4ZphodCYqiL3t36B3QZMQZIzrjCJRHdEHvcxVWZSgzKiqtm6Em4wo
	NwbSasIjIOqrEqEbpjqEaM9dgoBKJ+XgB0h5PIlH22TSqEXp97BMIewBsi
X-Received: by 2002:a17:90b:2584:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b1b0ba61famr5629200a91.33.1794686761104;
        Sat, 14 Nov 2026 12:06:01 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm5258887a91.0.2026.11.14.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:06:00 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:57 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
In-Reply-To: <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Christian Brauner writes:
>+	/* Look through stacking filesystems at the inode with the data. */
>+	if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEUDO)
>+		return -EINVAL;

This looks good in general, but what the bots said about O_PATH files
here is real. With FMODE_PATH this is reached for a file that was never
opened, so on overlayfs nothing has been through ovl_open() to look up
the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
itself, and when that fails it hits the WARN(1) at its end and returns
the overlayfs dentry, so the check passes as well.

Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
it's easy to trigger with that. From a quick test with a metacopy file
whose redirect into a data-only layer points at nothing, registering an
O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives

     ovl_d_real(/f, 0): real dentry not found
     WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
     [...]
      file_check_backing+0x308/0x5e0
      fuse_backing_new+0x219/0x4a0
      fuse_backing_open+0xe8/0x390
      fuse_dev_ioctl+0x53a/0x7d0

and the ioctl still succeeds. A normal open of that file fails with
ENOENT, so nothing could have used it as a backing file anyway, but with
panic_on_warn this is now a panic.

Maybe ovl_d_real() should just stop warning when the lookup fails, now
that it has a caller that isn't trace_uprobe? The check would still pass
for an O_PATH file whose lowerdata couldn't be looked up at that point,
though.

Thanks!

Chris
