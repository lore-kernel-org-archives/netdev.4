Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746656;
	b=okDZwdoRuqMSOI//+082WGiK39AfZHJZtMGaIDN9RekH7OTMeQkdFthAU7YjR+9zhOCq
	 jT0TG0UrqoaoonHBMbcjIH7ngS8s+WXcIEgj/EoLOkpjByNGkVA/N8imV8RZVTzJ1Wb+f
	 AnlatJT9fTgTv9fk4k2M/zWe0x4BAbBExJYlgcBVrAq4JH69EsxTdZ7N1F3RYj5myT0cN
	 7gWCoZPvjh7oyDYhQOz8zaFwSFngvkZI2Z0aSpU5+Lj8hSEReYDPnZpNiHQPZ2Ug/Q7k3
	 pOKavDHPV55HPGz3drFsNvCXs7MvYBycd0UWN0rwVL4Klh31ez+ntQURD0iOERP09/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746656;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yhPqhFmiPr+CMbPss5FuS1lnYkQ0ByFCw1K+Q5WzccA=;
	b=QQXEvzp0C4C1QCwSQij8VdGZq2tRpyRDYGjt43itKgU9epBiUBFdntmb9CEtsNovVgXr
	 bKYHtNKeydhLZYJMXLBxqEaW3XLnXvu+Lejp/5R0Z/O9fsCH5pqCTPnVXnv8qRvHQA9r9
	 +0nskFhxK/IXK80/PPfNtdS1s3SuegNJ0Q1A+Q8Mfw6C6xdURfPJzIN+kZTZ8DZV7x3X3
	 rO9FEQK99lQeYYDO1U4ZvXPGYtf2w6+Xr5iLtMXtYLj2NpSjo3j5/hJ3CRIfufFqv+qEj
	 341StAkz2phe9e2YRpVWu8H4Dbc1J+/3dhAQFnfKNGaqA9ZFFg7YeGplJIri+6lB9LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=da1hQ3Np;
	arc=none smtp.remote-ip=95.215.58.154
Received: from mta1.migadu.com (out-154.mta1.migadu.com [95.215.58.154])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF933606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF933606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=da1hQ3Np
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=21MWGW1/WGQFy49l3Efg4AOdUE1giNJT27Feeuow9j8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795746654; v=1; x=1796351454;
 b=da1hQ3NpHC2PvHLVxJB5EWqSZ8sbqJ7ogw9ldSI0BkGpDUlsyBjfiGqUDFxIoqBrni3okmuE
 Iidrw80cnZp/WP4+91R9W+tB8GJ6uOFhg8BjFn2WYvonubS1B+TPPb/ZLpqgH4ehEf6ttq9C4Ce
 Lx49K1dsLzH4lilQOFw3dJos=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 51ad85fc44c1ffed;
	Fri, 27 Nov 2026 02:30:50 +0000
X-Mizu-Trace-ID: 51ad85fc44c1ffed
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 10:30:36 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 6/6] selftests: net: big_tcp_tunnels: Cover
 IP tunnels
Message-ID: <awjrTKpsp0dO1qe4@fedora>
References: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
 <20261126025015.10416-7-yanhaishuang@cmss.chinamobile.com>
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
In-Reply-To: <20261126025015.10416-7-yanhaishuang@cmss.chinamobile.com>

On Wed, Nov 25, 2026 at 06:50:15PM -0800, Haishuang Yan wrote:
> Now that ipip, gre, gretap, sit, ip6tnl, ip6gre and ip6gretap allow BIG
> TCP too, run the same checks over them as for vxlan, geneve and
> bareudp, without encapsulation and with FOU and GUE. With FOU and GUE,
> turn on the outer UDP checksum, which is off by default on an IPv4
> underlay, so that it is checked too.
> 
> sit only carries IPv6, and is only run with veth tx checksum offload
> enabled: unlike the other tunnels it does not use gro_cells on receive,
> so with software GSO on the sender the receiver does not see any BIG
> TCP packet.
> 
> fou is not loaded on demand when it is built as a module, so load fou
> and fou6 first, and skip the FOU and GUE cases if that fails.
> 
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
> ---
>  .../testing/selftests/net/big_tcp_tunnels.sh  | 139 +++++++++++++++++-
>  1 file changed, 136 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
> index 9c1482b842b..1e8387fce99 100755
> --- a/tools/testing/selftests/net/big_tcp_tunnels.sh
> +++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
> @@ -1,7 +1,9 @@

[...]

>  
> +# For IP tunnels: $1: tunnel family, $2: encapsulation
>  cleanup_tunnel() {
> +	local fou_args=()
> +	local ns
> +
>  	ip -netns "$CLIENT_NS" link del tun0
>  	ip -netns "$SERVER_NS" link del tun1
> +	if [ "${2:-none}" = none ]; then
> +		return 0
> +	fi

nit: maybe just [ -z $2 ] ? No need to change if no new version.

> +	if [ "$1" = 6 ]; then
> +		fou_args=(-6)
> +	fi
> +	for ns in "$CLIENT_NS" "$SERVER_NS"; do
> +		ip -netns "$ns" fou del port "$FOU_PORT" "${fou_args[@]}"
> +	done
>  }
>  
>  cleanup() {
> @@ -240,6 +336,30 @@ if ! ip link help 2>&1 | grep gso_ipv4_max_size &> /dev/null; then
>  	exit "$ksft_skip"
>  fi
>  
> +# $1: tunnel type, $2: tunnel family, $3: traffic family, $4: encapsulation
> +run_ip_tunnel() {
> +	local csum_offload
> +
> +	for csum_offload in on off; do
> +		# sit does not use gro_cells on receive, so with software GSO
> +		# on the sender there is nothing big to receive.
> +		if [ "$1" = sit ] && [ "$csum_offload" = off ]; then
> +			continue
> +		fi
> +		setup_tunnel "$1" "$2" "$csum_offload" "$3" "$4" || exit "$?"
> +		do_test "$2" "$3" "$csum_offload" || exit "$?"
> +		cleanup_tunnel "$2" "$4"
> +	done
> +}
> +
> +# fou is not loaded on demand when built as a module
> +ENCAPS=(none)
> +if modprobe -q fou && modprobe -q fou6; then
> +	ENCAPS+=(fou gue)
> +else
> +	echo "SKIP: FOU and GUE tests, could not load fou and fou6"
> +fi
> +
>  WORKDIR=$(mktemp -d)
>  trap cleanup EXIT
>  setup
> @@ -254,3 +374,16 @@ for tunnel in vxlan geneve bareudp; do
>  		done
>  	done
>  done
> +for encap in "${ENCAPS[@]}"; do
> +	run_ip_tunnel ipip 4 4 "$encap"
> +	for traffic_family in 4 6; do
> +		run_ip_tunnel gre 4 "$traffic_family" "$encap"
> +		run_ip_tunnel gretap 4 "$traffic_family" "$encap"
> +	done
> +	run_ip_tunnel sit 4 6 "$encap"
> +	for traffic_family in 4 6; do
> +		run_ip_tunnel ip6tnl 6 "$traffic_family" "$encap"
> +		run_ip_tunnel ip6gre 6 "$traffic_family" "$encap"
> +		run_ip_tunnel ip6gretap 6 "$traffic_family" "$encap"
> +	done
> +done
> -- 
> 2.43.0
> 
> 

Tested-by: Hangbin Liu <liuhangbin@kylinos.cn>
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
