Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567312;
	b=vH65VwpwbeN58kW7boqCbEQwSHCWf/n5FZtpWAJYWw7jwNLcR87PMDExzn4Gg1SJAhyg
	 UqC+UUZtCi9Owgm0D2Fs7oAQfS7CY8G5Ad4iccp28V+RRMXPdtB7U5Fld8eestd3YQIX9
	 UORTtL6R8upiW5z7QocsNSEHRzwnC74O1tSdVFniFxGe1PxjoRugpElwAlKL6107Ad4Bd
	 wCd2mMmNPktI+vhiiq4GDnR9/CWC6m3OnKuFtOLTE3YN5N/Nbn4aAY0QniW8PHA6UWq3R
	 LnUMIY5OWeax3H3FSj/gNtuIyP/tAPDSEGCkh5zJSNZ8KNgzddanDG0NOxOc98ks7xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567312;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8Az4QnI06D29dHXRhcW0bCRSFOGyh4xpIpsF5fwFiHs=;
	b=j6T7+O6crxgasA/hDpXO9BKBubr2I/uPfA71z3CiQFUdf7xwlFkUiEwJHClOA+lrKWhL
	 jcy7cMlNCg+B7L4+Sy7pV7aex+NqAluSRSoX8nf94rxOzB1ZctUVYXgk2tHTNe44I2cer
	 lx5R5zuVC0IekcIvmZJ1GB4eVFA1msm+3muidYZYuhPht4dwSqpOOoD62ai6XazIfWQGb
	 V8LfMOFG0ymRDgyCVFXSPwH1EiHzP/8zpK1F3NSV7BK1OQ8pf0hBQneWoK+dnI6dKZ1Vd
	 65RzBLRYk9hZJwmUGG7kh7jh/AMVPGEhQrKaCGW2eoC9SF2MvAzRNqhcByh1ux4LOmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pKlQ4H04;
	arc=none smtp.remote-ip=91.218.175.251
Received: from mta0.migadu.com (out-251.mta0.migadu.com [91.218.175.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6726C606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6726C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pKlQ4H04
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5i8hmMKtVuUHVs5NH7TmYS/sUbqisINq3nsbH7cRRPs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795567309; v=1; x=1796172109;
 b=pKlQ4H04THnNWoJVfS2vJcLHgsjI4fgwR5aF3d91SzckFaOwOTevyGi+53tCLOOVa1QE11e9
 0Y9XpYJeQxoLo0YBLR9qpsMt7V+kJEAfGLP+EIu2xs2VhFrGHfeshsOvs+aV58l1Kta1f8hB+ZL
 A1aETZ3s5AVT8+mlLpBGg8NQ=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id c69787d82d27ec28;
	Wed, 25 Nov 2026 00:41:49 +0000
X-Mizu-Trace-ID: c69787d82d27ec28
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 08:41:33 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: tianyi@cloudflare.com, kuba@kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, sdf@fomichev.me,
	skhan@linuxfoundation.org, kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net-next v7 0/2] selftests: net: veth: propagate check
 failures to exit status
Message-ID: <20261125004133.GA19338@Liu-laptop>
References: <20261124214025.11603-1-emmaonana18@gmail.com>
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
In-Reply-To: <20261124214025.11603-1-emmaonana18@gmail.com>

On Tue, Nov 24, 2026 at 10:40:23PM +0100, Omokefe Emmanuel Onanaroghene wrote:
> Four checks in tools/testing/selftests/net/veth.sh report failures
> without setting ret, allowing the script to exit 0 even when a check
> fails. Set ret=1 in chk_channels() and the three "bad setting"
> negative tests identified by Tianyi during review of v2.
> 
> Patch 1 fixes the invalid TX channel test, which used nproc + 1
> to determine an out-of-range value. However, nproc can be lower
> than num_possible_cpus() when CPU affinity or cpusets restrict
> a process, meaning the kernel may accept the requested queue count.
> This could cause false failures on a correctly functioning
> kernel once the propagation patch makes failures honest.
> 
> Use the kernel-reported max_tx + 1 instead, ensuring the
> attempted value always exceeds the device's supported maximum.
> Spotted by Sashiko AI review of v2.
> 
> ---
> v7:
>   - Fix [1/2] subject numbering, lost in v6's send
> v6: https://lore.kernel.org/all/20261124211645.5751-1-emmaonana18@gmail.com/
>   - Squash the two propagation patches into one  and add
>     Tianyi's tags.
> v5: https://lore.kernel.org/all/20261121182217.4609-1-emmaonana18@gmail.com/
>   - Retarget to net-next and drop the Fixes tags
>   - Move the invalid-tx fix first, so no commit in the series can
>     report a false failure on a correct kernel.
>   - Fix the subject prefix on the invalid-tx patch, lost in v4's
>     send.
> v4: https://lore.kernel.org/all/20261119003003.40482-1-emmaonana18@gmail.com/
>   - Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
>     lines within 80 columns (thanks Tianyi for the review).
>   - Add patch 3 deriving the invalid tx value from the kernel maximum.
> v3: https://lore.kernel.org/all/20261116084107.6675-1-emmaonana18@gmail.com/
>   - Add Tianyi Gao's Tested-by to patch 1 (thanks!).
>   - Add patch 2 fixing the remaining three checks.
> v2: https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
>   - Correct Fixes tag to 1ec2230fc721.
> v1: https://lore.kernel.org/all/20261115212117.48496-1-emmaonana18@gmail.com/
>   - Initial posting.
> 
> Omokefe Emmanuel Onanaroghene (2):
>   selftests: net: veth: derive invalid-tx test value from kernel max
>   selftests: net: veth: propagate check failures to exit status
> 
>  tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> -- 
> 2.43.0

For the series

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
