Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467603;
	b=R9UI3z+ZjspoWKdF7B1PRMPD9x1BuHT9Dd7LvPeoTbLs2GR/O7TuUC86UfDee0LGojKh
	 QEwuCNEIexSOzGsxkWnDn+YXqSXg+hbd0vzJxAWzEuRKNuvxPzAkwC/iHxoVuxTtmjEGd
	 HwbQbdi0kGtWEKBGUQy51MNUwU44IHDny9XkYV1KnlSun5JKMMwjAtYa77f22GuTnnO55
	 yGsPzNuxm/3i54tmAYcf+Bxe1Ea4kn0sNGScGHg2zlzwbrOahaLtCi16mwBcS4gYixCHH
	 1ul3SoJNSpyoPWQJNMG3B7nCvLdMnO+ZY9VwoP6U53Q6meSpd8X+GJC3hEMh+4cnPew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467603;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q2WRLbnHYblS15W10EOQGRmEfJurtksMySvdGxKi37c=;
	b=ZuLVx2vC1SUIC01/NLS+Emty+90tHdw5vK0ZwQladqpoyY0huUS4RKpOJgTccPwhgjIJ
	 gZTP31YGPLsy8T/gNNbanuxeFAl+JpZ72M5QIZ3oQJSkeMFnz58UMaN6At/rfbpLJxawY
	 FDBQvlNKJg4BeeycKVYdM2QYxAebKkdd8jmnKtHavU6ud3c+8iqClB4gNllh5Udx2IxGg
	 F5VkJh+iDk4EVFwcoBaX47NEnIPHmSDvRVJkwZ6DCDJhyUHPV9sUGgipMuYxL21tWle3L
	 F7fhxpkHWZ1Ewzhv83dorrkUh/aEr1knQZ4SrmBjSiqdJ5SKhKFyt+xpSrpWp+P28ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYJw3RDD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47032606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYJw3RDD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1064E1F000C0;
	Mon, 23 Nov 2026 21:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467603;
	bh=Q2WRLbnHYblS15W10EOQGRmEfJurtksMySvdGxKi37c=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=SYJw3RDDh3Q8knDxbE4dxaafazrj2npZY4nZRNC1Ak8m84nKaIgNx5BPMd8WCFjs+
	 Z64gBr2gTfMJp3bBYpXeBjKprhWZj4rFrZDrXiCHxhsUChuipHzzJKGXvWodazPips
	 rYrYZPctH46maZ2Vwl44NB67BTDJKixYT2sZd76GEQ128yI/ZVXV3HPBNWxKMAuUe0
	 BierxzEitqeX5IlcLQjkqX4mpnZ4B9YoE4V63TG+LAYuiSu1J85WjrEyCK9RIjW4DG
	 M8QRCtDG6jL11E96nUbDydtMVqUcWA8TGzCR2hZTTCkDwZVoTUSaNpNHYkcb9OU/dK
	 qxRPhDmgSGI+Q==
Message-ID: <5a7ea9e4-cc8d-4b3d-9bf3-142d31b3fea1@kernel.org>
Date: Mon, 23 Nov 2026 14:00:02 -0700
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iproute2-next 0/7] bpf: fix mount point parsing and drop
 the legacy loader
Content-Language: en-US
To: Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org
References: <20261119190312.578885-1-stephen@networkplumber.org>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261119190312.578885-1-stephen@networkplumber.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 12:02 PM, Stephen Hemminger wrote:
> While looking at OSS Scanner reports noticed a pattern of issues
> around the BPF loader. The first set related to parsing of
> mount points with fscanf("%s").
> 
> The next part were issues from the legacy BPF loader which
> is no longer needed. This series rips the band-aid off
> and related parts no longer needed.
> 
> There were also some bugs in error handling found
> while changing all this.
> 
> Note: lib/bpf_legacy.c becomes lib/bpf_util.c. "ar rcs" does not
> drop members that are no longer built, so a stale bpf_legacy.o and
> sha1.o stay in lib/libutil.a and are picked up by the link. The
> build still succeeds, but run "make distclean" to be rid of them.
> 
> The libbpf build options are gone: libbpf is now always required,
> and pkg-config is the only way it is found. Both --libbpf_force and
> --libbpf_dir are now rejected rather than silently ignored.
> 
> The last patch adds a tc bpf test, there was none before. It caught
> a regression in this series that the build did not: the tc/ pin
> subdirectory quietly went missing.
> 
> Since v1: squashed the four libbpf configure patches into one,
> dropped the bpf_pinning fallback fix since the loader removal
> deletes that code anyway, moved the tc-bpf(8) update next to the
> change it documents, and reworded the export removal after Jamal
> pointed out that LIBBPF_FORCE=off builds did have a working
> import/run. Dropped Toke's Reviewed-by from the mount point check:
> it now also restores the pin subdirectory, so it is not the patch
> he reviewed.
> 

fixed a compile error introduced by patch 6 and applied the set to
iproute2-next

